require 'administrate/field/string'

class Spree::Order::State < Administrate::Field::String
  def to_s
    data
  end

  def states
    options.fetch(:states, {})
  end

  def default
    options.fetch(:default, 'secondary')
  end

  def to_partial_path
    "/fields/spree/order/state/#{page}"
  end
end
