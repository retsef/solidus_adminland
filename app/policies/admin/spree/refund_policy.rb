module Admin
  class Spree::RefundPolicy < Spree::BasePolicy
    authorize :order

    pre_check :any_payments?

    def any_payments?
      allow! if order.payments.any?
    end
  end
end
