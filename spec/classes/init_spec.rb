require 'spec_helper'
describe 'ezjail' do

  context 'with defaults for all parameters' do
    it { should contain_class('ezjail') }
  end
end
