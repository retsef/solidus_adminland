class Spree::ShippingMethodDashboard < Spree::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    id: Field::Number,
    name: Field::String,
    code: Field::String,

    calculator: Field::HasOne,

    shipping_categories: Field::HasMany.with_options(class_name: 'Spree::ShippingCategory'),
    shipping_rates: Field::HasMany.with_options(class_name: 'Spree::ShippingRate'),
    shipments: Field::HasMany.with_options(class_name: 'Spree::Shipment'),
    cartons: Field::HasMany,
    zones: Field::HasMany.with_options(class_name: 'Spree::Zone'),
    tax_category: Field::BelongsTo.with_options(class_name: 'Spree::TaxCategory'),
    stock_locations: Field::HasMany.with_options(class_name: 'Spree::StockLocation'),
    stores: Field::HasMany.with_options(class_name: 'Spree::Store'),

    tracking_url: Field::String,
    admin_name: Field::String,
    available_to_all: Field::Boolean,
    carrier: Field::String,
    service_level: Field::String,
    available_to_users: Field::Boolean,
    deleted_at: Field::DateTime,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = %i[
    name
    code
    shipping_categories
    shipping_rates
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = %i[
    id
    name
    admin_name
    code
    available_to_all
    calculator
    shipping_categories
    shipping_rates
    shipments
    cartons
    zones
    tax_category
    stock_locations
    stores
    tracking_url
    carrier
    service_level
    available_to_users
    deleted_at
    created_at
    updated_at
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = %i[
    name
    shipping_categories
    shipping_rates
    tax_category
    stock_locations
    stores
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
