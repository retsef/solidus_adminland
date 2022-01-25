class Spree::StockItemResource < Madmin::Resource
  # Attributes
  attribute :id, form: false
  attribute :count_on_hand
  attribute :created_at, form: false
  attribute :updated_at, form: false
  attribute :backorderable
  attribute :deleted_at

  # Associations
  attribute :stock_location
  attribute :variant
  attribute :stock_movements

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
