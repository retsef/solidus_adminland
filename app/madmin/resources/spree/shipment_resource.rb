class Spree::ShipmentResource < Madmin::Resource
  # Attributes
  attribute :id, form: false
  attribute :tracking
  attribute :number
  attribute :cost
  attribute :shipped_at
  attribute :deprecated_address_id
  attribute :state
  attribute :created_at, form: false
  attribute :updated_at, form: false
  attribute :adjustment_total
  attribute :additional_tax_total
  attribute :promo_total
  attribute :included_tax_total

  # Associations
  attribute :order
  attribute :stock_location
  attribute :adjustments
  attribute :inventory_units
  attribute :shipping_rates
  attribute :shipping_methods
  attribute :state_changes
  attribute :cartons
  attribute :line_items

  # Uncomment this to customize the display name of records in the admin area.
  # def self.display_name(record)
  #   record.name
  # end

  # Uncomment this to customize the default sort column and direction.
  # def self.default_sort_column
  #   "created_at"
  # end
  #
  # def self.default_sort_direction
  #   "desc"
  # end
end
