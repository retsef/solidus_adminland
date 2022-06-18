class Spree::ProductDashboard < Spree::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    id: Field::Number,
    name: Field::String,
    description: Field::ActionText,
    available_on: Field::Date.with_options(filterable: true),
    discontinue_on: Field::Date.with_options(filterable: true),
    slug: Field::String,
    promotionable: Field::Boolean.with_options(filterable: true),

    price: Field::Money,
    cost_price: Field::Money.with_options(searchable: false),
    cost_currency: Field::Select.with_options(searchable: false, collection: Spree::Config.available_currencies.map(&:iso_code), selected: Spree::Config.currency),

    sku: Field::String.with_options(searchable: false),
    weight: Field::String.with_options(searchable: false),
    height: Field::String.with_options(searchable: false),
    width: Field::String.with_options(searchable: false),
    depth: Field::String.with_options(searchable: false),
    track_inventory: Field::Boolean.with_options(searchable: false),

    option_types: Field::HasMany.with_options(class_name: 'Spree::OptionType', filterable: true),
    # properties: Field::HasMany.with_options(class_name: 'Spree::Property'),
    product_properties: Field::NestedHasMany.with_options(class_name: 'Spree::ProductProperty', skip: %i[product position]),
    # images: Field::NestedHasMany.with_options(class_name: 'Spree::Image', skip: %i[viewable position alt]),

    # classifications: Field::HasMany.with_options(class_name: 'Spree::Classification'),
    taxons: Field::HasMany.with_options(class_name: 'Spree::Taxon', filterable: true),
    tax_category: Field::BelongsTo.with_options(class_name: 'Spree::TaxCategory'),
    shipping_category: Field::BelongsTo.with_options(class_name: 'Spree::ShippingCategory'),
    # stores: Field::HasMany.with_options(class_name: 'Spree::Store', filterable: true),

    variants: Field::HasMany.with_options(class_name: 'Spree::Variant'),
    prices: Field::HasMany.with_options(class_name: 'Spree::Price'),
    stock_items: Field::HasMany.with_options(class_name: 'Spree::StockItem'),
    orders: Field::HasMany.with_options(class_name: 'Spree::Order'),

    meta_title: Field::String,
    meta_description: Field::Text,
    meta_keywords: Field::String,
    deleted_at: Field::DateTime,
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
    sku
    stores
    price
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = %i[
    name
    description
    available_on
    slug
    promotionable
    discontinue_on

    sku
    price

    product_properties
    option_types

    tax_category
    shipping_category
    stores

    meta_title
    meta_description
    meta_keywords
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = %i[
    name
    description
    available_on
    discontinue_on

    price
    cost_price
    cost_currency
    promotionable

    sku
    weight
    height
    width
    depth
    track_inventory

    option_types
    product_properties
    taxons
    tax_category
    shipping_category
    stores
    variants

    slug
    meta_title
    meta_description
    meta_keywords
  ].freeze

  FORM_ATTRIBUTES_NEW = %i[
    name
    description
    available_on
    discontinue_on

    price
    cost_price
    cost_currency
    promotionable

    sku
    weight
    height
    width
    depth
    track_inventory

    option_types
    product_properties
    taxons
    tax_category
    shipping_category
    stores

    variants
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

  def collection_includes
    [:stores, { master: %i[images prices] }] # , :variant_images, { variants: %i[images], master: %i[images prices] }]
  end

  # Overwrite this method to customize how products are displayed
  # across all pages of the admin dashboard.
  #
  def display_resource(product)
    product.name
  end
end
