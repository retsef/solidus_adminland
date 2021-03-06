class Spree::CreditCardDashboard < Spree::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    id: Field::Number,
    name: Field::String,
    default: Field::Boolean,
    month: Field::String,
    year: Field::String,
    cc_type: Field::String,
    last_digits: Field::String,
    gateway_customer_profile_id: Field::String,
    gateway_payment_profile_id: Field::String,

    payment_method: Field::BelongsTo,
    payments: Field::HasMany,
    # wallet_payment_sources: Field::HasMany,
    user: Field::BelongsTo,
    address: Field::BelongsTo,

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
    default
    payment_method
    payments
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = %i[
    id
    name
    default
    created_at
    updated_at
    payment_method
    payments
    gateway_customer_profile_id
    gateway_payment_profile_id
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = %i[
    name
    default
    month
    year
    cc_type
    last_digits
    gateway_customer_profile_id
    gateway_payment_profile_id
    payment_method
    address
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

  # Overwrite this method to customize how credit cards are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(credit_card)
  #   "Spree::CreditCard ##{credit_card.id}"
  # end
end
