module Spree::PromotionActionOverride
  extend ActiveSupport::Concern

  class_methods do
    def model_name
      model_name ||= super
      model_name.instance_variable_set(:@route_key, 'actions')
      model_name.instance_variable_set(:@singular_route_key, 'action')

      model_name
    end
  end
end

Spree::PromotionAction.include Spree::PromotionActionOverride
