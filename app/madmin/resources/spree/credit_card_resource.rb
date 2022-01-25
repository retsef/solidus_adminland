class Spree::CreditCardResource < Madmin::Resource
  # Attributes
  attribute :id, form: false
  attribute :month
  attribute :year
  attribute :cc_type
  attribute :last_digits
  attribute :gateway_customer_profile_id
  attribute :gateway_payment_profile_id
  attribute :created_at, form: false
  attribute :updated_at, form: false
  attribute :name
  attribute :default

  # Associations
  attribute :payment_method
  attribute :payments
  attribute :wallet_payment_sources
  attribute :user
  attribute :address

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
