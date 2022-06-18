module Spree::PaymentMethodOverride
  extend ActiveSupport::Concern

  class_methods do
    def model_name
      model_name ||= super

      parent_model_name = Spree::PaymentMethod.model_name

      model_name.instance_variable_set(:@route_key, parent_model_name.route_key)
      model_name.instance_variable_set(:@singular_route_key, parent_model_name.singular_route_key)

      model_name
    end
  end
end

Rails.application.config.spree.payment_methods.each do |payment_method|
  payment_method.include Spree::PaymentMethodOverride
end
