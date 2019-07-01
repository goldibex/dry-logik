require 'examples/di/config'
require 'dry/auto_inject'

RSpec.describe 'using DI for app configuration' do
  it 'can be quite handy' do
    Import = Dry::AutoInject(DI.container)

    class MyThing
      include Import['config.username', 'config.password', 'config.service_url']

      def call
        "https://#{username}:#{password}@#{service_url}"
      end
    end

    t = MyThing.new
    expect(t.call).to match(/api\.hackerman\.com/)
  end
end
