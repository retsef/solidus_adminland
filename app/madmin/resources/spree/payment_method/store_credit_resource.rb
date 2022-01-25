class Spree::PaymentMethod::StoreCreditResource < Madmin::Resource
  # Attributes
  attribute :id, form: false
  attribute :type
  attribute :name
  attribute :description
  attribute :active
  attribute :deleted_at
  attribute :created_at, form: false
  attribute :updated_at, form: false
  attribute :auto_capture
  attribute :preferences
  attribute :preference_source
  attribute :position
  attribute :available_to_users
  attribute :available_to_admin

  # Associations
  attribute :payments
  attribute :credit_cards
  attribute :store_payment_methods
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
