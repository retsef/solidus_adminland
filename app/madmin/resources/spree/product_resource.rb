class Spree::ProductResource < Madmin::Resource
  # Attributes
  attribute :id, form: false
  attribute :name
  attribute :description
  attribute :promotionable
  attribute :discontinue_on
  attribute :available_on
  attribute :slug
  attribute :meta_title
  attribute :meta_description
  attribute :meta_keywords
  attribute :deleted_at, form: false
  attribute :created_at, form: false
  attribute :updated_at, form: false

  # Associations
  # attribute :slugs
  attribute :product_option_types
  attribute :option_types
  # attribute :product_properties
  attribute :properties
  # attribute :variant_property_rules
  # attribute :variant_property_rule_values
  # attribute :variant_property_rule_conditions
  attribute :classifications
  attribute :taxons
  # attribute :product_promotion_rules
  # attribute :promotion_rules
  attribute :tax_category
  attribute :shipping_category
  # attribute :master
  # attribute :variants
  attribute :prices
  attribute :orders, form: false

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
