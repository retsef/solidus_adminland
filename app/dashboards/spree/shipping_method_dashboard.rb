require "administrate/base_dashboard"

class Spree::ShippingMethodDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    calculator: Field::HasOne,
    shipping_method_categories: Field::HasMany,
    shipping_categories: Field::HasMany,
    shipping_rates: Field::HasMany,
    shipments: Field::HasMany,
    cartons: Field::HasMany,
    shipping_method_zones: Field::HasMany,
    zones: Field::HasMany,
    tax_category: Field::BelongsTo,
    shipping_method_stock_locations: Field::HasMany,
    stock_locations: Field::HasMany,
    store_shipping_methods: Field::HasMany,
    stores: Field::HasMany,
    id: Field::Number,
    name: Field::String,
    deleted_at: Field::DateTime,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
    tracking_url: Field::String,
    admin_name: Field::String,
    code: Field::String,
    available_to_all: Field::Boolean,
    carrier: Field::String,
    service_level: Field::String,
    available_to_users: Field::Boolean,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = %i[
    calculator
    shipping_method_categories
    shipping_categories
    shipping_rates
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = %i[
    calculator
    shipping_method_categories
    shipping_categories
    shipping_rates
    shipments
    cartons
    shipping_method_zones
    zones
    tax_category
    shipping_method_stock_locations
    stock_locations
    store_shipping_methods
    stores
    id
    name
    deleted_at
    created_at
    updated_at
    tracking_url
    admin_name
    code
    available_to_all
    carrier
    service_level
    available_to_users
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = %i[
    calculator
    shipping_method_categories
    shipping_categories
    shipping_rates
    shipments
    cartons
    shipping_method_zones
    zones
    tax_category
    shipping_method_stock_locations
    stock_locations
    store_shipping_methods
    stores
    name
    deleted_at
    tracking_url
    admin_name
    code
    available_to_all
    carrier
    service_level
    available_to_users
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

  # Overwrite this method to customize how shipping methods are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(shipping_method)
  #   "Spree::ShippingMethod ##{shipping_method.id}"
  # end
end
