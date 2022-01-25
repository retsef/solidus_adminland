class Spree::StockLocationResource < Madmin::Resource
  # Attributes
  attribute :id, form: false
  attribute :name
  attribute :created_at, form: false
  attribute :updated_at, form: false
  attribute :default
  attribute :address1
  attribute :address2
  attribute :city
  attribute :state_name
  attribute :zipcode
  attribute :phone
  attribute :active
  attribute :backorderable_default
  attribute :propagate_all_variants
  attribute :admin_name
  attribute :position
  attribute :restock_inventory
  attribute :fulfillable
  attribute :code
  attribute :check_stock_on_transfer

  # Associations
  attribute :shipments
  attribute :stock_items
  attribute :cartons
  attribute :stock_movements
  attribute :user_stock_locations
  attribute :users
  attribute :state
  attribute :country
  attribute :shipping_method_stock_locations
  attribute :shipping_methods

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
