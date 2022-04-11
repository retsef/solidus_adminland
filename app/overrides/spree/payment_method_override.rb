module Spree::PaymentMethodOverride
  extend ActiveSupport::Concern

  class_methods do
    def real_model_name
      ActiveModel::Name.new(self, nil, self.to_s)
    end
    
    def model_name
      Spree::PaymentMethod.model_name
    end
  end
end

Rails.application.config.spree.payment_methods.each do |payment_method|
  payment_method.include Spree::PaymentMethodOverride
end
