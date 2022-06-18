module Admin
  class Spree::CustomerReturnPolicy < Spree::BasePolicy
    authorize :order

    pre_check :any_line_items?
    pre_check :order_completed?

    def index?
      true
    end

    private

    def any_line_items?
      deny! if order.line_items.empty?
    end

    def order_completed?
      deny! unless order.completed?
    end
  end
end
