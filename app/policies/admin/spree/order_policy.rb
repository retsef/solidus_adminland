module Admin
  class Spree::OrderPolicy < Spree::BasePolicy
    alias_rule :export?, to: :manage?
  end
end
