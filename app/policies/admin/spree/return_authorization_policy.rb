module Admin
  class Spree::ReturnAuthorizationPolicy < Spree::BasePolicy
    authorize :order

    pre_check :order_shipped?

    def order_shipped?
      deny! unless order.shipped?
    end
  end
end
