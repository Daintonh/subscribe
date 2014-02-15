require 'warden'
require 'dynamic_form'
module Subscribe
  class Engine < ::Rails::Engine
    isolate_namespace Subscribe

    config.generators do |g|
      g.test_framework :rspec, :view_specs => false
    end

    config.middleware.use Warden::Manager do |manager|
      manager.default_strategies :password
    end

  end
end
