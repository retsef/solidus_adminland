class Spree::PriceResource < Madmin::Resource
  # Attributes
  attribute :id, form: false
  attribute :amount
  attribute :currency
  attribute :deleted_at
  attribute :created_at, form: false
  attribute :updated_at, form: false
  attribute :country_iso

  # Associations
  attribute :variant
  attribute :country

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
