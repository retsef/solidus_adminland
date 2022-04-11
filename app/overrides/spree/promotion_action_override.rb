module Spree::PromotionActionOverride
  extend ActiveSupport::Concern

  class_methods do
    def real_model_name
      ActiveModel::Name.new(self, nil, self.to_s)
    end

    def model_name
      ActiveModel::Name.new(self, nil, 'Action')
    end
  end
end

Spree::PromotionAction.include Spree::PromotionActionOverride
