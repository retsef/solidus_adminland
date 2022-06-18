module Admin
  class Spree::ProductPolicy < Spree::BasePolicy
    alias_rule :export?, :clone?, to: :manage?
  end
end
