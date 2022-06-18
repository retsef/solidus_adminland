class Spree::Calculator::FlatRateDashboard < Spree::BaseDashboard
  ATTRIBUTE_TYPES = {
    calculable: Field::Polymorphic,
    id: Field::Number,
    type: Field::String,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
    preferences: Field::Text,

    preferred_amount: Field::Number,
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
    id
    calculable
    preferred_amount
    preferred_currency
    created_at
    updated_at
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = %i[
    preferred_amount
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

  # Overwrite this method to customize how distributed amounts are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(distributed_amount)
  #   "Spree::Calculator::DistributedAmount ##{distributed_amount.id}"
  # end
end
