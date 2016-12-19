require 'serverspec'
set :backend, :exec

describe 'Docker package' do
  describe package('docker-engine') do
    it { should be_installed }
  end
end
 
describe 'Docker daemon is running' do
  describe service('docker') do
    it { should be_enabled }
    it { should be_running }
  end
end
