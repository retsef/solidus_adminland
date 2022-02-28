class Spree::ReturnAuthorizationDashboard < Spree::Order::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    id: Field::Number,
    number: Field::String,
    state: Field::String,
    memo: Field::Text,
    reason: Field::BelongsTo,
    return_reason_id: Field::Number,

    order: Field::BelongsTo,
    return_items: Field::HasMany,
    inventory_units: Field::HasMany,
    customer_returns: Field::HasMany,
    stock_location: Field::BelongsTo,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = %i[
    number
    state
    created_at
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = %i[
    order
    return_items
    inventory_units
    customer_returns
    stock_location
    reason
    id
    number
    state
    memo
    created_at
    updated_at
    return_reason_id
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = %i[
    order
    return_items
    inventory_units
    customer_returns
    stock_location
    reason
    number
    state
    memo
    return_reason_id
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

  # Overwrite this method to customize how return authorizations are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(return_authorization)
  #   "Spree::ReturnAuthorization ##{return_authorization.id}"
  # end
end
