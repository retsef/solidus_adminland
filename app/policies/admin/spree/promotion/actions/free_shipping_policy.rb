module Admin
  class Spree::Promotion::Actions::FreeShippingPolicy < Spree::Promotion::Actions::BasePolicy
    def edit?
      false
    end
  end
end
