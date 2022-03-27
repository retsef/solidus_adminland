module Spree::PromotionActionOverride
  extend ActiveSupport::Concern

  class_methods do
    def model_name
      ActiveModel::Name.new(self, nil, 'Action')
    end
  end
end

Spree::PromotionAction.include Spree::PromotionActionOverride
