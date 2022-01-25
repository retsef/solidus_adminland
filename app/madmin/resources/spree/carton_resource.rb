class Spree::CartonResource < Madmin::Resource
  # Attributes
  attribute :id, form: false
  attribute :number
  attribute :external_number
  attribute :tracking
  attribute :shipped_at
  attribute :created_at, form: false
  attribute :updated_at, form: false
  attribute :imported_from_shipment_id

  # Associations
  attribute :address
  attribute :stock_location
  attribute :shipping_method
  attribute :inventory_units
  attribute :orders
  attribute :shipments

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
