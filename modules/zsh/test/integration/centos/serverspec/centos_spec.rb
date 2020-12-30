# -*- ruby -*-

require 'serverspec'

set :backend, :exec

describe 'Package' do
  describe package('zsh') do
    it { should be_installed }
  end
end
# EOF
