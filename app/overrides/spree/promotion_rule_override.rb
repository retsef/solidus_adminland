module Spree::PromotionRuleOverride
  extend ActiveSupport::Concern

  class_methods do
    def real_model_name
      ActiveModel::Name.new(self, nil, self.to_s)
    end

    def model_name
      ActiveModel::Name.new(self, nil, 'Rule')
    end
  end
end

Spree::PromotionRule.include Spree::PromotionRuleOverride
