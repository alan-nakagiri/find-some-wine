# frozen_string_literal: true

require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module FindSomeWine
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.2

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.

    # config.generators do |generate|
    #   generate.javascripts true
    #   generate.stylesheets false
    #   generate.helper false
    #   generate.factory_girl true
    #   generate.routing_specs false
    #   generate.view_specs true
    #   generate.request_specs false
    # end
    # Filter params from showing up in logs or Sentry
    config.filter_parameters << :password
    config.autoload_paths += Dir[Rails.root.join('app', 'models', '{*/}')]
    config.autoload_paths += Dir[Rails.root.join('app', 'models', '{*/}', '{*/}')]
    # rubocop:enable Rails/FilePath

    config.action_dispatch.default_headers = {
      'X-Frame-Options' => 'DENY'
    }

    config.exceptions_app = routes

    # config.factory_bot.definition_file_paths = ["spec/factories"]
    # config.factory_bot.definition_file_paths = []
  end
end
