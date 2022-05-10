module Admin
  class Spree::CustomerReturnPolicy < Spree::BasePolicy
    authorize :order
  end
end
