require 'dry/container'

module DI

  def container
    config = Dry::Container::Namespace.new('config') do
      register('username', 'bob@hackerman.com')
      register('password', 'hunter2')
      register('service_url', 'api.hackerman.com/v1')
    end

    Dry::Container.new.tap do |app|
      app.import(config)
    end
  end

  module_function :container

end
