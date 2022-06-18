module Admin
  class Spree::RefundPolicy < Spree::BasePolicy
    authorize :order

    pre_check :any_payments?

    def any_payments?
      deny! if order.payments.empty?
    end

    def index?
      order.payments.completed.any?
    end
  end
end
