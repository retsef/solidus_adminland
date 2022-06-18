module Admin
  class Spree::UserPolicy < Spree::BasePolicy
    alias_rule :export?, to: :manage?
  end
end
