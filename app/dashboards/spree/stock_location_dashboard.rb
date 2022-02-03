class Spree::StockLocationDashboard < Spree::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    shipments: Field::HasMany,
    stock_items: Field::HasMany,
    cartons: Field::HasMany,
    stock_movements: Field::HasMany,
    user_stock_locations: Field::HasMany,
    users: Field::HasMany,
    state: Field::BelongsTo,
    country: Field::BelongsTo,
    shipping_method_stock_locations: Field::HasMany,
    shipping_methods: Field::HasMany,
    id: Field::Number,
    name: Field::String,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
    default: Field::Boolean,
    address1: Field::String,
    address2: Field::String,
    city: Field::String,
    state_name: Field::String,
    zipcode: Field::String,
    phone: Field::String,
    active: Field::Boolean,
    backorderable_default: Field::Boolean,
    propagate_all_variants: Field::Boolean,
    admin_name: Field::String,
    position: Field::Number,
    restock_inventory: Field::Boolean,
    fulfillable: Field::Boolean,
    code: Field::String,
    check_stock_on_transfer: Field::Boolean
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = %i[
    shipments
    stock_items
    cartons
    stock_movements
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = %i[
    shipments
    stock_items
    cartons
    stock_movements
    user_stock_locations
    users
    state
    country
    shipping_method_stock_locations
    shipping_methods
    id
    name
    created_at
    updated_at
    default
    address1
    address2
    city
    state_name
    zipcode
    phone
    active
    backorderable_default
    propagate_all_variants
    admin_name
    position
    restock_inventory
    fulfillable
    code
    check_stock_on_transfer
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = %i[
    shipments
    stock_items
    cartons
    stock_movements
    user_stock_locations
    users
    state
    country
    shipping_method_stock_locations
    shipping_methods
    name
    default
    address1
    address2
    city
    state_name
    zipcode
    phone
    active
    backorderable_default
    propagate_all_variants
    admin_name
    position
    restock_inventory
    fulfillable
    code
    check_stock_on_transfer
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

  # Overwrite this method to customize how stock locations are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(stock_location)
  #   "Spree::StockLocation ##{stock_location.id}"
  # end
end
