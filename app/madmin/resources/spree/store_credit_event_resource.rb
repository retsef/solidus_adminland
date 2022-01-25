class Spree::StoreCreditEventResource < Madmin::Resource
  # Attributes
  attribute :id, form: false
  attribute :action
  attribute :amount
  attribute :user_total_amount
  attribute :authorization_code
  attribute :deleted_at
  attribute :created_at, form: false
  attribute :updated_at, form: false
  attribute :amount_remaining

  # Associations
  attribute :store_credit
  attribute :originator
  attribute :store_credit_reason

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
