class Spree::PaymentResource < Madmin::Resource
  # Attributes
  attribute :id, form: false
  attribute :amount
  attribute :state
  attribute :response_code
  attribute :avs_response
  attribute :created_at, form: false
  attribute :updated_at, form: false
  attribute :number
  attribute :cvv_response_code
  attribute :cvv_response_message

  # Associations
  attribute :order
  attribute :source
  attribute :payment_method
  attribute :offsets
  attribute :log_entries
  attribute :state_changes
  attribute :capture_events
  attribute :refunds

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
