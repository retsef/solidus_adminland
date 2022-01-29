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
  
    config.eager_load_paths << Rails.root.join('app', 'forms')

    # overrides = "#{Rails.root}/app/overrides"
    # Rails.autoloaders.main.ignore(overrides)
    # config.to_prepare do
    #   Dir.glob("#{overrides}/**/*_override.rb").each do |override|
    #     load override
    #   end
    # end

    # Load application's model / class decorators
    # initializer 'spree.decorators' do |_app|
    #   config.to_prepare do
    #     Dir.glob(Rails.root.join('app/**/*_decorator*.rb')) do |path|
    #       require_dependency(path)
    #     end
    #   end
    # end

    config.i18n.load_path += Dir[Rails.root.join('config', 'locales', '**', '*.{rb,yml}')]
  end
end
