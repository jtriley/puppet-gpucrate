require 'spec_helper'
describe 'gpucrate' do

  context 'with defaults for all parameters' do
    it { should contain_class('gpucrate') }
  end
end
