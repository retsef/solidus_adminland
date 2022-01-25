class Spree::ReturnAuthorizationResource < Madmin::Resource
  # Attributes
  attribute :id, form: false
  attribute :number
  attribute :state
  attribute :memo
  attribute :created_at, form: false
  attribute :updated_at, form: false
  attribute :return_reason_id

  # Associations
  attribute :order
  attribute :return_items
  attribute :inventory_units
  attribute :customer_returns
  attribute :stock_location
  attribute :reason

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
