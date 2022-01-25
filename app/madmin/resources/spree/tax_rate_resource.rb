class Spree::TaxRateResource < Madmin::Resource
  # Attributes
  attribute :id, form: false
  attribute :amount
  attribute :included_in_price
  attribute :created_at, form: false
  attribute :updated_at, form: false
  attribute :name
  attribute :show_rate_in_label
  attribute :deleted_at
  attribute :starts_at
  attribute :expires_at

  # Associations
  attribute :calculator
  attribute :zone
  attribute :tax_rate_tax_categories
  attribute :tax_categories
  attribute :adjustments
  attribute :shipping_rate_taxes

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
