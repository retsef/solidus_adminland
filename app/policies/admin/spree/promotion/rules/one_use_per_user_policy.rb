module Admin
  class Spree::Promotion::Rules::OneUsePerUserPolicy < Spree::Promotion::Rules::BasePolicy
    def edit?
      false
    end
  end
end
