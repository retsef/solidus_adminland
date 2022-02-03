class Spree::PaymentMethodDashboard < Spree::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    payments: Field::HasMany,
    credit_cards: Field::HasMany,
    store_payment_methods: Field::HasMany,
    stores: Field::HasMany,
    id: Field::Number,
    type: Field::String,
    name: Field::String,
    description: Field::Text,
    active: Field::Boolean,
    deleted_at: Field::DateTime,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
    auto_capture: Field::Boolean,
    preferences: Field::Text,
    preference_source: Field::String,
    position: Field::Number,
    available_to_users: Field::Boolean,
    available_to_admin: Field::Boolean
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = %i[
    payments
    credit_cards
    store_payment_methods
    stores
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = %i[
    payments
    credit_cards
    store_payment_methods
    stores
    id
    type
    name
    description
    active
    deleted_at
    created_at
    updated_at
    auto_capture
    preferences
    preference_source
    position
    available_to_users
    available_to_admin
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = %i[
    payments
    credit_cards
    store_payment_methods
    stores
    type
    name
    description
    active
    deleted_at
    auto_capture
    preferences
    preference_source
    position
    available_to_users
    available_to_admin
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

  # Overwrite this method to customize how payment methods are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(payment_method)
  #   "Spree::PaymentMethod ##{payment_method.id}"
  # end
end
