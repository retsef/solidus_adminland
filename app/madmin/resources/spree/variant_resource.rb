class Spree::VariantResource < Madmin::Resource
  # Attributes
  attribute :id, form: false
  attribute :sku
  attribute :weight
  attribute :height
  attribute :width
  attribute :depth
  attribute :deleted_at
  attribute :is_master
  attribute :cost_price
  attribute :position
  attribute :cost_currency
  attribute :track_inventory
  attribute :updated_at, form: false
  attribute :created_at, form: false

  # Associations
  attribute :product
  attribute :tax_category
  attribute :inventory_units
  attribute :line_items
  attribute :orders
  attribute :stock_items
  attribute :stock_locations
  attribute :stock_movements
  attribute :option_values_variants
  attribute :option_values
  attribute :images
  attribute :prices

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
