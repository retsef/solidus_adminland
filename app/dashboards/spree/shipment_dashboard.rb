require "administrate/base_dashboard"

class Spree::ShipmentDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    order: Field::BelongsTo,
    stock_location: Field::BelongsTo,
    adjustments: Field::HasMany,
    inventory_units: Field::HasMany,
    shipping_rates: Field::HasMany,
    shipping_methods: Field::HasMany,
    state_changes: Field::HasMany,
    cartons: Field::HasMany,
    line_items: Field::HasMany,
    id: Field::Number,
    tracking: Field::String,
    number: Field::String,
    cost: Field::String.with_options(searchable: false),
    shipped_at: Field::DateTime,
    deprecated_address_id: Field::Number,
    state: Field::String,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
    adjustment_total: Field::String.with_options(searchable: false),
    additional_tax_total: Field::String.with_options(searchable: false),
    promo_total: Field::String.with_options(searchable: false),
    included_tax_total: Field::String.with_options(searchable: false),
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = %i[
    order
    stock_location
    adjustments
    inventory_units
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = %i[
    order
    stock_location
    adjustments
    inventory_units
    shipping_rates
    shipping_methods
    state_changes
    cartons
    line_items
    id
    tracking
    number
    cost
    shipped_at
    deprecated_address_id
    state
    created_at
    updated_at
    adjustment_total
    additional_tax_total
    promo_total
    included_tax_total
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = %i[
    order
    stock_location
    adjustments
    inventory_units
    shipping_rates
    shipping_methods
    state_changes
    cartons
    line_items
    tracking
    number
    cost
    shipped_at
    deprecated_address_id
    state
    adjustment_total
    additional_tax_total
    promo_total
    included_tax_total
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

  # Overwrite this method to customize how shipments are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(shipment)
  #   "Spree::Shipment ##{shipment.id}"
  # end
end
