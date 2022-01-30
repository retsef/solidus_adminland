require "administrate/base_dashboard"

class Spree::ProductDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    slugs: Field::HasMany,
    product_option_types: Field::HasMany,
    option_types: Field::HasMany,
    product_properties: Field::HasMany,
    properties: Field::HasMany,
    variant_property_rules: Field::HasMany,
    variant_property_rule_values: Field::HasMany,
    variant_property_rule_conditions: Field::HasMany,
    classifications: Field::HasMany,
    taxons: Field::HasMany,
    product_promotion_rules: Field::HasMany,
    promotion_rules: Field::HasMany,
    tax_category: Field::BelongsTo,
    shipping_category: Field::BelongsTo,
    master: Field::HasOne,
    variants: Field::HasMany,
    variants_including_master: Field::HasMany,
    prices: Field::HasMany,
    stock_items: Field::HasMany,
    line_items: Field::HasMany,
    orders: Field::HasMany,
    variant_images: Field::HasMany,
    id: Field::Number,
    name: Field::String,
    description: Field::Text,
    available_on: Field::DateTime,
    deleted_at: Field::DateTime,
    slug: Field::String,
    meta_description: Field::Text,
    meta_keywords: Field::String,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
    promotionable: Field::Boolean,
    meta_title: Field::String,
    discontinue_on: Field::DateTime,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = %i[
    slugs
    product_option_types
    option_types
    product_properties
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = %i[
    slugs
    product_option_types
    option_types
    product_properties
    properties
    variant_property_rules
    variant_property_rule_values
    variant_property_rule_conditions
    classifications
    taxons
    product_promotion_rules
    promotion_rules
    tax_category
    shipping_category
    master
    variants
    variants_including_master
    prices
    stock_items
    line_items
    orders
    variant_images
    id
    name
    description
    available_on
    deleted_at
    slug
    meta_description
    meta_keywords
    created_at
    updated_at
    promotionable
    meta_title
    discontinue_on
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = %i[
    slugs
    product_option_types
    option_types
    product_properties
    properties
    variant_property_rules
    variant_property_rule_values
    variant_property_rule_conditions
    classifications
    taxons
    product_promotion_rules
    promotion_rules
    tax_category
    shipping_category
    master
    variants
    variants_including_master
    prices
    stock_items
    line_items
    orders
    variant_images
    name
    description
    available_on
    deleted_at
    slug
    meta_description
    meta_keywords
    promotionable
    meta_title
    discontinue_on
  ].freeze

  # COLLECTION_FILTERS
  # a hash that defines filters that can be used while searching via the search
  # field of the dashboard.
  #
  # For example to add an option to search for open resources by typing "open:"
  # in the search field:
  #
  #   COLLECTION_FILTERS = {
  #     open: ->(resources) { resources.where(open: true) }
  #   }.freeze
  COLLECTION_FILTERS = {}.freeze

  # Overwrite this method to customize how products are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(product)
  #   "Spree::Product ##{product.id}"
  # end
end
