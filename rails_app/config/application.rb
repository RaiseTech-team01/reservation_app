require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module RailsApp
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.1

    config.i18n.default_locale = :ja
    config.time_zone = "Asia/Tokyo"
    config.active_record.default_timezone = :local

    config.generators do |g|
      g.template_engine false
      g.javascripts false
      g.stylesheets false
      g.helper false
      g.test_framwork :rspec,
                      view_specs: false,
                      routing_specs: false,
                      helper_specs: false,
                      controller_specs: false,
                      request_specs: true
    end

    config.api_only = true
  end
end
