class Spree::StoreCreditResource < Madmin::Resource
  # Attributes
  attribute :id, form: false
  attribute :amount
  attribute :amount_used
  attribute :amount_authorized
  attribute :currency
  attribute :memo
  attribute :deleted_at
  attribute :created_at, form: false
  attribute :updated_at, form: false
  attribute :type_id
  attribute :invalidated_at

  # Associations
  attribute :payment_method
  attribute :payments
  attribute :wallet_payment_sources
  attribute :user
  attribute :created_by
  attribute :category
  attribute :credit_type
  attribute :store_credit_events

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
