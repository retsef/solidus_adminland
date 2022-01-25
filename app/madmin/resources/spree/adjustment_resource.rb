class Spree::AdjustmentResource < Madmin::Resource
  # Attributes
  attribute :id, form: false
  attribute :amount
  attribute :label
  attribute :eligible
  attribute :created_at, form: false
  attribute :updated_at, form: false
  attribute :included
  attribute :finalized

  # Associations
  attribute :adjustable
  attribute :source
  attribute :order
  attribute :promotion_code
  attribute :adjustment_reason

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
