class Admin::BasePolicy < ApplicationPolicy
  authorize :user, allow_nil: true
end
