class Spree::Promotion::Actions::CreateQuantityAdjustmentsResource < Madmin::Resource
  # Attributes
  attribute :id, form: false
  attribute :position
  attribute :type
  attribute :deleted_at
  attribute :preferences
  attribute :created_at, form: false
  attribute :updated_at, form: false

  # Associations
  attribute :promotion
  attribute :calculator
  attribute :adjustments
  attribute :line_item_actions
  attribute :line_items

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
