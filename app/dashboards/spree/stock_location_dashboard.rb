class Spree::StockLocationDashboard < Spree::BaseDashboard
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
    
    active: Field::Boolean,
    default: Field::Boolean,
    backorderable_default: Field::Boolean,

    restock_inventory: Field::Boolean,
    fulfillable: Field::Boolean,
    check_stock_on_transfer: Field::Boolean,
    propagate_all_variants: Field::Boolean,

    address1: Field::String,
    address2: Field::String,
    city: Field::String,
    state_name: Field::String,
    zipcode: Field::String,
    phone: Field::String,
    # users: Field::HasMany,
    state: Field::BelongsTo.with_options(class_name: 'Spree::State'),
    country: Field::BelongsTo.with_options(class_name: 'Spree::Country'),

    shipping_methods: Field::HasMany.with_options(class_name: 'Spree::ShippingMethod'),
    # shipments: Field::HasMany,
    stock_items: Field::HasMany.with_options(class_name: 'Spree::StockItem'),
    # cartons: Field::HasMany,
    stock_movements: Field::HasMany.with_options(class_name: 'Spree::StockMovement'),

    admin_name: Field::String,
    created_at: Field::DateTime,
    updated_at: Field::DateTime
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
    stock_items
    stock_movements
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = %i[
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
    position
    restock_inventory
    fulfillable
    check_stock_on_transfer
    stock_items
    stock_movements
    state
    country
    shipping_methods
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = %i[
    name
    code
    default
    admin_name
    active
    position

    address1
    address2
    city
    state_name
    zipcode
    phone
    backorderable_default
    propagate_all_variants
    restock_inventory
    fulfillable
    check_stock_on_transfer
    state
    country
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
  def display_resource(stock_location)
    stock_location.name
  end
end
