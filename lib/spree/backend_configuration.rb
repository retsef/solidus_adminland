# frozen_string_literal: true

require 'spree/preferences/configuration'

module Spree
  class BackendConfiguration < Preferences::Configuration
    preference :locale, :string, default: I18n.default_locale

    def menu_items
      Rails.application.config.admin_navigation
    end
  end
end
