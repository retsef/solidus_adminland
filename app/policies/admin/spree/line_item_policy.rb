module Admin
  class Spree::LineItemPolicy < Spree::BasePolicy
    authorize :order
    # pre_check :order_completed, only: %i[]

    alias_rule :new?, :edit?, :update?, :destroy?, to: :allow_edit

    def allow_edit
      return true unless order.completed?

      false
    end
  end
end
