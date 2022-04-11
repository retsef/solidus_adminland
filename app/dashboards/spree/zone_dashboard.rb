class Spree::ZoneDashboard < Spree::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    id: Field::Number,
    name: Field::String,
    description: Field::String,
    # zone_members: Field::HasMany,
    zone_members_count: Field::Number,
    countries: Field::HasMany.with_options(class_name: 'Spree::Country'),
    states: Field::HasMany.with_options(class_name: 'Spree::State'),
    # shipping_method_zones: Field::HasMany,
    shipping_methods: Field::HasMany.with_options(class_name: 'Spree::ShippingMethod'),
    tax_rates: Field::HasMany.with_options(class_name: 'Spree::TaxRate'),
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
    description
    countries
    states
    tax_rates
    shipping_methods
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = %i[
    id
    name
    description
    tax_rates
    countries
    states
    shipping_methods
    created_at
    updated_at
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = %i[
    name
    description
    tax_rates
    countries
    states
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

  # Overwrite this method to customize how zones are displayed
  # across all pages of the admin dashboard.
  #
  def display_resource(zone)
    zone.name
  end
end
