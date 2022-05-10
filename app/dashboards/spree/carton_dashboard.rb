class Spree::CartonDashboard < Spree::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    address: Field::BelongsTo,
    stock_location: Field::BelongsTo,
    shipping_method: Field::BelongsTo,
    inventory_units: Field::HasMany,
    orders: Field::HasMany,
    shipments: Field::HasMany,
    id: Field::Number,
    number: Field::String,
    external_number: Field::String,
    tracking: Field::String,
    shipped_at: Field::DateTime,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
    imported_from_shipment_id: Field::Number,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = %i[
    address
    stock_location
    shipping_method
    inventory_units
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = %i[
    address
    stock_location
    shipping_method
    inventory_units
    orders
    shipments
    id
    number
    external_number
    tracking
    shipped_at
    created_at
    updated_at
    imported_from_shipment_id
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = %i[
    address
    stock_location
    shipping_method
    inventory_units
    orders
    shipments
    number
    external_number
    tracking
    shipped_at
    imported_from_shipment_id
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

  # Overwrite this method to customize how cartons are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(carton)
  #   "Spree::Carton ##{carton.id}"
  # end
end
