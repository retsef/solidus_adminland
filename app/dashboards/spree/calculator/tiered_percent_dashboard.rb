class Spree::Calculator::TieredPercentDashboard < Spree::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    calculable: Field::Polymorphic,
    id: Field::Number,
    type: Field::String,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
    preferences: Field::Text,

    preferred_base_percent: Field::Number,
    preferred_tiers: Field::Text,
    preferred_currency: Field::Select.with_options(collection: Spree::Config.available_currencies.map(&:iso_code), selected: Spree::Config.currency),
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = %i[
    calculable
    id
    type
    created_at
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = %i[
    calculable
    preferred_base_percent
    preferred_tiers
    preferred_currency
    created_at
    updated_at
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = %i[
    preferred_base_percent
    preferred_tiers
    preferred_currency
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

  # Overwrite this method to customize how tiered percents are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(tiered_percent)
  #   "Spree::Calculator::TieredPercent ##{tiered_percent.id}"
  # end
end
