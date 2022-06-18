class Spree::StoreCreditDashboard < Spree::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    payment_method: Field::BelongsTo,
    payments: Field::HasMany,
    wallet_payment_sources: Field::HasMany,
    user: Field::BelongsTo,
    created_by: Field::BelongsTo,
    category: Field::BelongsTo,
    credit_type: Field::BelongsTo,
    store_credit_events: Field::HasMany,
    id: Field::Number,
    amount: Field::Number.with_options(searchable: false),
    amount_used: Field::Number.with_options(searchable: false),
    amount_authorized: Field::Number.with_options(searchable: false),
    currency: Field::Select.with_options(collection: Spree::Config.available_currencies.map(&:iso_code), selected: Spree::Config.currency),
    memo: Field::Text,
    deleted_at: Field::DateTime,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
    type_id: Field::Number,
    invalidated_at: Field::DateTime,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = %i[
    payment_method
    payments
    wallet_payment_sources
    user
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = %i[
    payment_method
    payments
    wallet_payment_sources
    user
    created_by
    category
    credit_type
    store_credit_events
    id
    amount
    amount_used
    amount_authorized
    currency
    memo
    deleted_at
    created_at
    updated_at
    type_id
    invalidated_at
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = %i[
    payment_method
    payments
    wallet_payment_sources
    user
    created_by
    category
    credit_type
    store_credit_events
    amount
    amount_used
    amount_authorized
    currency
    memo
    deleted_at
    type_id
    invalidated_at
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

  # Overwrite this method to customize how store credits are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(store_credit)
  #   "Spree::StoreCredit ##{store_credit.id}"
  # end
end
