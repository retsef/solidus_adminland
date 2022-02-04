class Spree::StockLocationDashboard < Spree::BaseDashboard

  def display_resource(resource)
    "#{resource.name}"
  end

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
    position: Field::Number,
    restock_inventory: Field::Boolean,
    fulfillable: Field::Boolean,
    check_stock_on_transfer: Field::Boolean,
    shipments: Field::HasMany,
    stock_items: Field::HasMany,
    cartons: Field::HasMany,
    stock_movements: Field::HasMany,
    user_stock_locations: Field::HasMany,

    default: Field::Boolean,
    address1: Field::String,
    address2: Field::String,
    city: Field::String,
    state_name: Field::String,
    zipcode: Field::String,
    phone: Field::String,
    active: Field::Boolean,
    users: Field::HasMany,
    state: Field::BelongsTo,
    country: Field::BelongsTo,

    shipping_method_stock_locations: Field::HasMany,
    shipping_methods: Field::HasMany,
    backorderable_default: Field::Boolean,
    propagate_all_variants: Field::Boolean,
    admin_name: Field::String,
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
    default
    shipments
    stock_items
    cartons
    stock_movements
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = %i[
    id
    name
    code
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
    check_stock_on_transfer
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
    created_at
    updated_at
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = %i[
    name
    code
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
    check_stock_on_transfer
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
