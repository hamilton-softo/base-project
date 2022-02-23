require_relative "boot"

require "rails"
# Pick the frameworks you want:
require "active_model/railtie"
require "active_job/railtie"
require "active_record/railtie"
require "active_storage/engine"
require "action_controller/railtie"
require "action_mailer/railtie"
require "action_mailbox/engine"
require "action_text/engine"
require "action_view/railtie"
require "action_cable/engine"
require "rails/test_unit/railtie"

Bundler.require(*Rails.groups)

module BaseProject
  class Application < Rails::Application
    config.load_defaults 6.1
    config.api_only = true
    config.time_zone = "Brasilia"
    I18n.enforce_available_locales = false
    I18n.default_locale = :"pt-BR"
    config.api_only = true
    config.active_record.schema_format = :sql
    config.generators do |g|
      g.test_framework :rspec
    end
  end
end
