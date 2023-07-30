require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module ArthackdayWeb
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.0

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.

    # Explicitely allow Time classes to be loaded from yaml
    # Re: https://discuss.rubyonrails.org/t/cve-2022-32224-possible-rce-escalation-bug-with-serialized-columns-in-active-record/81017/1
    #config.active_record.yaml_column_permitted_classes = [Symbol, Date, Time, ActiveSupport::TimeWithZone, ActiveSupport::TimeZone] # This doesn't fucking do anything
    config.active_record.use_yaml_unsafe_load = true
  end
end
