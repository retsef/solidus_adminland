class Spree::Order::LineItemDashboard < Spree::Order::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    id: Field::Number,
    order: Field::BelongsTo.with_options(class_name: 'Spree::Order'),
    variant: Field::BelongsTo.with_options(class_name: 'Spree::Variant'),
    # tax_category: Field::BelongsTo,
    # product: Field::HasOne,
    #  adjustments: Field::HasMany,
    # inventory_units: Field::HasMany,
    # line_item_actions: Field::HasMany,
    # actions: Field::HasMany,
    quantity: Field::Number,
    price: Field::Money,
    created_at: Field::DateTime,
    updated_at: Field::DateTime
    # cost_price: Field::String.with_options(searchable: false),
    # adjustment_total: Field::String.with_options(searchable: false),
    # additional_tax_total: Field::String.with_options(searchable: false),
    # promo_total: Field::String.with_options(searchable: false),
    # included_tax_total: Field::String.with_options(searchable: false),
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = %i[
    variant
    price
    quantity
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = %i[
    order
    variant
    quantity
    price
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = %i[
    variant
    quantity
  ].freeze

  FORM_ATTRIBUTES_NEW = %i[
    variant
    quantity
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

  # Overwrite this method to customize how line items are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(line_item)
  #   "Spree::LineItem ##{line_item.id}"
  # end
end
