class Spree::ShippingMethodResource < Madmin::Resource
  # Attributes
  attribute :id, form: false
  attribute :name
  attribute :deleted_at
  attribute :created_at, form: false
  attribute :updated_at, form: false
  attribute :tracking_url
  attribute :admin_name
  attribute :code
  attribute :available_to_all
  attribute :carrier
  attribute :service_level
  attribute :available_to_users

  # Associations
  attribute :calculator
  attribute :shipping_method_categories
  attribute :shipping_categories
  attribute :shipping_rates
  attribute :shipments
  attribute :cartons
  attribute :shipping_method_zones
  attribute :zones
  attribute :tax_category
  attribute :shipping_method_stock_locations
  attribute :stock_locations
  attribute :store_shipping_methods
  attribute :stores

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
