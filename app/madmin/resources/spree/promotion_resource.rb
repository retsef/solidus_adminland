class Spree::PromotionResource < Madmin::Resource
  # Attributes
  attribute :id, form: false
  attribute :description
  attribute :expires_at
  attribute :starts_at
  attribute :name
  attribute :type
  attribute :usage_limit
  attribute :match_policy
  attribute :advertise
  attribute :path
  attribute :created_at, form: false
  attribute :updated_at, form: false
  attribute :per_code_usage_limit
  attribute :apply_automatically

  # Associations
  attribute :promotion_category
  attribute :promotion_rules
  attribute :promotion_actions
  attribute :order_promotions
  attribute :orders
  attribute :codes
  attribute :promotion_code_batches

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
