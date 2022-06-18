module Admin
  class Spree::Promotion::Rules::FirstOrderPolicy < Spree::Promotion::Rules::BasePolicy
    def edit?
      false
    end
  end
end
