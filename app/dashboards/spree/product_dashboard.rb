require 'administrate/base_dashboard'

class Spree::ProductDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    id: Field::Number,
    name: Field::String,
    description: Field::Text,
    available_on: Field::DateTime,
    discontinue_on: Field::DateTime,
    deleted_at: Field::DateTime,
    slug: Field::String,
    meta_title: Field::String,
    meta_description: Field::Text,
    meta_keywords: Field::String,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
    promotionable: Field::Boolean,

    product_option_types: Field::HasMany,
    option_types: Field::HasMany,
    product_properties: Field::HasMany,
    properties: Field::HasMany,
    classifications: Field::HasMany,
    taxons: Field::HasMany,
    tax_category: Field::BelongsTo,
    shipping_category: Field::BelongsTo,
    variants: Field::HasMany,
    prices: Field::HasMany,
    stock_items: Field::HasMany,
    orders: Field::HasMany,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = %i[
    id
    name
    description
    available_on
    discontinue_on
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = %i[
    id
    name
    description
    available_on
    deleted_at
    slug
    meta_title
    meta_description
    meta_keywords
    created_at
    updated_at
    promotionable
    discontinue_on

    product_option_types
    option_types
    product_properties
    properties
    classifications
    taxons
    tax_category
    shipping_category
    variants
    prices
    stock_items
    orders
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = %i[
    name
    description
    available_on
    deleted_at
    slug
    meta_title
    meta_description
    meta_keywords
    promotionable
    discontinue_on

    product_option_types
    option_types
    product_properties
    properties
    classifications
    taxons
    tax_category
    shipping_category
    variants
    prices
    stock_items
    orders
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
