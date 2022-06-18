module Spree::PromotionRuleOverride
  extend ActiveSupport::Concern

  class_methods do
    def model_name
      model_name ||= super
      model_name.instance_variable_set(:@route_key, 'rules')
      model_name.instance_variable_set(:@singular_route_key, 'rule')

      model_name
    end
  end
end

Spree::PromotionRule.include Spree::PromotionRuleOverride
