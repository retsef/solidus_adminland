module Admin
  class Spree::PaymentPolicy < Spree::BasePolicy
    authorize :order

    def edit?
      record.pending?
    end

    def capture?
      return false unless record.actions.include? 'capture'

      order.completed?
    end

    def void?
      return false unless record.actions.include? 'void'

      true
    end
  end
end
