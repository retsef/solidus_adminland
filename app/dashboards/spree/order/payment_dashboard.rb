class Spree::Order::PaymentDashboard < Spree::Order::BaseDashboard
  STATE_CLASSES = {
    complete: 'success',
    pending: 'warning',
    invalid: 'danger',
    purchased: 'success',
    declined: 'danger'
  }.freeze

  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    id: Field::Number,
    number: Field::String,
    cvv_response_code: Field::String,
    cvv_response_message: Field::String,
    amount: Field::Money.with_options(searchable: false),
    state: Field::Select.with_options(collection: STATE_CLASSES.keys, filterable: true, states: STATE_CLASSES, default: 'warning'),
    response_code: Field::String,
    avs_response: Field::String,

    source: Field::Polymorphic.with_options(classes: [Spree::CreditCard]),
    payment_method: Field::BelongsTo.with_options(class_name: 'Spree::PaymentMethod'),
    # offsets: Field::HasMany,
    # log_entries: Field::HasMany,
    # state_changes: Field::HasMany,
    # capture_events: Field::HasMany,
    # refunds: Field::HasMany,

    order: Field::BelongsTo.with_options(class_name: 'Spree::Order'),

    created_at: Field::DateTime,
    updated_at: Field::DateTime
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = %i[
    created_at
    number
    state
    payment_method
    amount
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = %i[
    number
    amount
    state
    payment_method

    response_code
    avs_response
    cvv_response_code
    cvv_response_message

    source

    created_at
    updated_at
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = %i[
    amount
    payment_method
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

  # Overwrite this method to customize how payments are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(payment)
  #   "Spree::Payment ##{payment.id}"
  # end
end
