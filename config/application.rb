require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module SolidusAdminBackend
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.1

    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    # config.time_zone = "Central Time (US & Canada)"
    # config.eager_load_paths << Rails.root.join("extras")
  
    config.eager_load_paths << Rails.root.join('lib', 'spree', 'backend')
    config.eager_load_paths << Rails.root.join('app', 'forms')

    # Load application's model / class decorators
    initializer 'spree.decorators' do |_app|
      config.to_prepare do
        Dir.glob(Rails.root.join('app/**/*_override*.rb')) do |path|
          require_dependency(path)
        end
      end
    end

    # I18n
    config.i18n.load_path += Dir[Rails.root.join('config', 'locales', '**', '*.{rb,yml}')]
    
    # Permitted locales available for the application
    config.i18n.available_locales = [:en, :it]

    # Set default locale to something other than :en
    config.i18n.default_locale = :it
  end
end
