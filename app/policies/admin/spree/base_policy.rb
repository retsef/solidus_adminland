module Admin
  class Spree::BasePolicy < BasePolicy
    relation_scope(&:all) # default fallback

    default_rule :manage?

    # If you want manage? to catch really everything, place this alias
    alias_rule :index?, :create?, :new?, to: :manage?
    def manage?
      true
    end
  end
end
