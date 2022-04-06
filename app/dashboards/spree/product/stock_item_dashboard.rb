class Spree::Product::StockItemDashboard < Spree::Product::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    id: Field::Number,
    variant_name: Field::String,
    variant: Field::BelongsTo.with_options(class_name: 'Spree::Variant'),
    stock_location: Field::BelongsTo.with_options(class_name: 'Spree::StockLocation'),
    stock_movements: Field::HasMany.with_options(class_name: 'Spree::StockMovement'),
    count_on_hand: Field::Number,
    backorderable: Field::Boolean,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
    deleted_at: Field::DateTime
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = %i[
    variant_name
    variant
    stock_location
    backorderable
    count_on_hand
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = %i[
    count_on_hand
    backorderable
    stock_location
    stock_movements
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = %i[
    stock_location
    backorderable
    count_on_hand
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

  # Overwrite this method to customize how stock items are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(stock_item)
  #   "Spree::StockItem ##{stock_item.id}"
  # end
end
