require 'warden'
require 'dynamic_form'
require 'subscribe/active_record_extensions'
require 'houser'

module Subscribe
  class Engine < ::Rails::Engine
    isolate_namespace Subscribe

    config.generators do |g|
      g.test_framework :rspec, :view_specs => false
    end

    config.middleware.use Warden::Manager do |manager|
      manager.default_strategies :password
    end

    initializer 'subscribe.middleware.houser' do
      Rails.application.config.middleware.use Houser::Middleware,
      :class_name => 'Subscribe::Account'
    end

    config.to_prepare do
      root = Subscribe::Engine.root
      extenders_path = root + "app/extenders/**/*.rb"
      Dir.glob(extenders_path) do |file|
        Rails.configuration.cache_classes ? require(file) : load(file)
      end
    end

  end
end
