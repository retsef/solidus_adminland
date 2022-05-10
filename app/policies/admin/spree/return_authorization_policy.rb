module Admin
  class Spree::ReturnAuthorizationPolicy < Spree::BasePolicy
    authorize :order

    pre_check :order_shipped?, only: %i[new create]

    def order_shipped?
      allow! if order.shipped?
    end
  end
end
