require 'spec_helper'

describe 'gpucrate', :type => :class do

  Static::OSFACTS.each_key do |osfamily|

    context "on #{osfamily}" do

      let(:facts) { Static::OSFACTS[osfamily] }

      it { should compile.with_all_deps }
      it { should contain_class('gpucrate') }
      it { should contain_class('gpucrate::params') }
      it { should contain_class('gpucrate::install')}
      it { should contain_class('gpucrate::config').that_requires('Class[gpucrate::install]') }
      it { should contain_class('gpucrate::create').that_requires('Class[gpucrate::config]') }

      it { should contain_file('gpucrate config directory').with_path('/etc/gpucrate') }
      it { should contain_file('gpucrate config file').with_path('/etc/gpucrate/config.yaml') }
      it { should contain_exec('create gpucrate volume').with_command('/usr/bin/gpucrate create') }
      it { should contain_python__pip('gpucrate') }

    end
  end
end
