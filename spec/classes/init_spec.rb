require 'spec_helper'

describe 'gpucrate', :type => :class do

  Static::OSFACTS.each_key do |osfamily|

    context "on #{osfamily}" do

      let(:facts) { Static::OSFACTS[osfamily] }

      default_volume_root = '/usr/local/gpucrate'

      it { should compile.with_all_deps }
      it { should contain_class('gpucrate') }
      it { should contain_class('gpucrate::params') }
      it { should contain_class('gpucrate::install')}
      it { should contain_class('gpucrate::config').that_requires('Class[gpucrate::install]') }
      it { should contain_class('gpucrate::create').that_requires('Class[gpucrate::config]') }

      it { should contain_file('gpucrate config directory').with_path('/etc/gpucrate') }
      it { should contain_file('gpucrate config file').with_path('/etc/gpucrate/config.yaml') }
      it { should contain_file('gpucrate config file').with_content(/volume_root: #{default_volume_root}/) }
      it { should contain_exec('create gpucrate volume').with_command('/usr/bin/gpucrate create') }
      it { should contain_exec('create gpucrate volume').with_creates("#{default_volume_root}/384.81") }
      it { should contain_python__pip('gpucrate') }

      context "with empty nvidia_driver_version" do
        let(:facts) { Static::OSFACTS[osfamily].merge({ 'nvidia_driver_version' => '' }) }
        it { should_not contain_exec('create gpucrate volume') }
      end

      context "with custom pip install params" do
        venv_path = '/path/to/a/virtualenv'
        let(:params) { { 'pip_params' => { 'virtualenv' => venv_path } } }
        it { should contain_python__pip('gpucrate').with_virtualenv(venv_path) }
      end
    end
  end
end
