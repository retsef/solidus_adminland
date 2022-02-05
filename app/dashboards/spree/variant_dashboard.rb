class Spree::VariantDashboard < Spree::BaseDashboard
  def display_resource(resource)
    resource.sku.to_s
  end

  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    id: Field::Number,
    sku: Field::String,
    weight: Field::String.with_options(searchable: false),
    height: Field::String.with_options(searchable: false),
    width: Field::String.with_options(searchable: false),
    depth: Field::String.with_options(searchable: false),
    is_master: Field::Boolean,
    cost_price: Field::String.with_options(searchable: false),
    position: Field::Number,
    cost_currency: Field::String,
    track_inventory: Field::Boolean,

    product: Field::BelongsTo.with_options(class_name: 'Spree::Product'),
    tax_category: Field::BelongsTo.with_options(class_name: 'Spree::TaxCategory'),
    inventory_units: Field::HasMany.with_options(class_name: 'Spree::InventoryUnit'),
    # line_items: Field::HasMany,
    # orders: Field::HasMany,
    stock_items: Field::HasMany.with_options(class_name: 'Spree::StockItem'),
    stock_locations: Field::HasMany.with_options(class_name: 'Spree::StockLocation'),
    stock_movements: Field::HasMany.with_options(class_name: 'Spree::StockMovement'),
    # option_values_variants: Field::HasMany,
    option_values: Field::HasMany.with_options(class_name: 'Spree::OptionValue'),
    images: Field::HasMany.with_options(class_name: 'Spree::Image'),
    prices: Field::HasMany.with_options(class_name: 'Spree::Price'),
    deleted_at: Field::DateTime,
    updated_at: Field::DateTime,
    created_at: Field::DateTime
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = %i[
    product
    tax_category
    inventory_units
    line_items
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = %i[
    product
    tax_category
    inventory_units
    line_items
    orders
    stock_items
    stock_locations
    stock_movements
    option_values_variants
    option_values
    images
    prices
    id
    sku
    weight
    height
    width
    depth
    deleted_at
    is_master
    cost_price
    position
    cost_currency
    track_inventory
    updated_at
    created_at
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = %i[
    product
    tax_category
    inventory_units
    line_items
    orders
    stock_items
    stock_locations
    stock_movements
    option_values_variants
    option_values
    images
    prices
    sku
    weight
    height
    width
    depth
    deleted_at
    is_master
    cost_price
    position
    cost_currency
    track_inventory
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

  # Overwrite this method to customize how variants are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(variant)
  #   "Spree::Variant ##{variant.id}"
  # end
end
