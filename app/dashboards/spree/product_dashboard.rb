class Spree::ProductDashboard < Spree::BaseDashboard
  def display_resource(resource)
    resource.name.to_s
  end

  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    id: Field::Number,
    name: ::Spree::Product::NamePreview,
    description: Field::Text,
    available_on: Field::DateTime,
    discontinue_on: Field::DateTime,
    slug: Field::String,
    promotionable: Field::Boolean,

    sku: Field::String,
    price: Field::Money,

    option_types: Field::HasMany.with_options(class_name: 'Spree::OptionType'),
    properties: Field::HasMany.with_options(class_name: 'Spree::Property'),
    classifications: Field::HasMany,
    taxons: Field::HasMany.with_options(class_name: 'Spree::Taxon'),
    tax_category: Field::BelongsTo.with_options(class_name: 'Spree::TaxCategory'),
    shipping_category: Field::BelongsTo.with_options(class_name: 'Spree::ShippingCategory'),
    variants: Field::HasMany.with_options(class_name: 'Spree::Variant'),
    prices: Field::HasMany.with_options(class_name: 'Spree::Price'),
    stock_items: Field::HasMany.with_options(class_name: 'Spree::StockItem'),
    orders: Field::HasMany.with_options(class_name: 'Spree::Order'),

    meta_title: Field::String,
    meta_description: Field::Text,
    meta_keywords: Field::String,
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
    sku
    available_on
    discontinue_on
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

    properties
    option_types
    
    tax_category
    shipping_category

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
    slug
    price
    promotionable

    sku
    option_types
    properties
    taxons
    tax_category
    shipping_category
    variants

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
    promotionable

    option_types
    taxons
    tax_category
    shipping_category

    sku
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
