require 'serverspec'
set :backend, :exec

describe 'hello-world image exists' do
  describe docker_image('dockercloud/hello-world:latest') do
    it { should exist }
  end
end
 
describe 'hello-world container is running' do
  describe docker_container('hello_world') do
    it { should exist }
    it { should be_running }
  end
end

describe 'port 80 should be open' do
  describe port(80) do
    it { should be_listening }
  end
end
