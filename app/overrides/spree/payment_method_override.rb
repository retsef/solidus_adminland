module Spree::PaymentMethodOverride
  extend ActiveSupport::Concern

  class_methods do
    def real_model_name
      ActiveModel::Name.new(self, nil, self.to_s)
    end

    def model_name
      ActiveModel::Name.new(self, nil, 'Spree::PaymentMethod')
    end
  end
end

Spree::PaymentMethod.include Spree::PaymentMethodOverride
