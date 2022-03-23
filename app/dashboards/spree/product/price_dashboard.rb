class Spree::Product::PriceDashboard < Spree::Product::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    id: Field::Number,
    variant: Field::BelongsTo.with_options(class_name: 'Spree::Variant'),
    amount: Field::Money.with_options(searchable: false),

    country: Field::BelongsTo.with_options(class_name: 'Spree::Country'),
    country_iso: Field::Select.with_options(collection: Spree::Country.all.map { |c| [c.name, c.iso] }),
    currency: Field::Select.with_options(collection: Spree::Config.available_currencies.map(&:iso_code), selected: Spree::Config.currency),
    deleted_at: Field::DateTime
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = %i[
    country
    amount
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = %i[
    variant
    amount
    currency
    country
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = %i[
    amount
    currency
    country_iso
  ].freeze

  FORM_ATTRIBUTES_NEW = %i[
    amount
    currency
    country_iso
  ].freeze

  FORM_ATTRIBUTES_EDIT = %i[
    amount
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

  # Overwrite this method to customize how prices are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(price)
  #   "Spree::Price ##{price.id}"
  # end
end
