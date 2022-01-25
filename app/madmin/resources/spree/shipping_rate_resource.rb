class Spree::ShippingRateResource < Madmin::Resource
  # Attributes
  attribute :id, form: false
  attribute :selected
  attribute :cost
  attribute :created_at, form: false
  attribute :updated_at, form: false
  attribute :tax_rate_id

  # Associations
  attribute :shipment
  attribute :shipping_method
  attribute :taxes

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
