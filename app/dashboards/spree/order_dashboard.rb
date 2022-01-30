require "administrate/base_dashboard"

class Spree::OrderDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    user: Field::BelongsTo,
    bill_address: Field::BelongsTo,
    ship_address: Field::BelongsTo,
    store: Field::BelongsTo,
    line_items: Field::HasMany,
    variants: Field::HasMany,
    products: Field::HasMany,
    shipments: Field::HasMany,
    inventory_units: Field::HasMany,
    cartons: Field::HasMany,
    adjustments: Field::HasMany,
    line_item_adjustments: Field::HasMany,
    shipment_adjustments: Field::HasMany,
    all_adjustments: Field::HasMany,
    order_promotions: Field::HasMany,
    promotions: Field::HasMany,
    payments: Field::HasMany,
    valid_store_credit_payments: Field::HasMany,
    return_authorizations: Field::HasMany,
    return_items: Field::HasMany,
    customer_returns: Field::HasMany,
    reimbursements: Field::HasMany,
    refunds: Field::HasMany,
    state_changes: Field::HasMany,
    created_by: Field::BelongsTo,
    approver: Field::BelongsTo,
    canceler: Field::BelongsTo,
    id: Field::Number,
    number: Field::String,
    item_total: Field::String.with_options(searchable: false),
    total: Field::String.with_options(searchable: false),
    state: Field::String,
    adjustment_total: Field::String.with_options(searchable: false),
    completed_at: Field::DateTime,
    payment_total: Field::String.with_options(searchable: false),
    shipment_state: Field::String,
    payment_state: Field::String,
    email: Field::String,
    special_instructions: Field::Text,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
    currency: Field::String,
    last_ip_address: Field::String,
    shipment_total: Field::String.with_options(searchable: false),
    additional_tax_total: Field::String.with_options(searchable: false),
    promo_total: Field::String.with_options(searchable: false),
    channel: Field::String,
    included_tax_total: Field::String.with_options(searchable: false),
    item_count: Field::Number,
    approved_at: Field::DateTime,
    confirmation_delivered: Field::Boolean,
    guest_token: Field::String,
    canceled_at: Field::DateTime,
    approver_name: Field::String,
    frontend_viewable: Field::Boolean,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = %i[
    user
    bill_address
    ship_address
    store
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = %i[
    user
    bill_address
    ship_address
    store
    line_items
    variants
    products
    shipments
    inventory_units
    cartons
    adjustments
    line_item_adjustments
    shipment_adjustments
    all_adjustments
    order_promotions
    promotions
    payments
    valid_store_credit_payments
    return_authorizations
    return_items
    customer_returns
    reimbursements
    refunds
    state_changes
    created_by
    approver
    canceler
    id
    number
    item_total
    total
    state
    adjustment_total
    completed_at
    payment_total
    shipment_state
    payment_state
    email
    special_instructions
    created_at
    updated_at
    currency
    last_ip_address
    shipment_total
    additional_tax_total
    promo_total
    channel
    included_tax_total
    item_count
    approved_at
    confirmation_delivered
    guest_token
    canceled_at
    approver_name
    frontend_viewable
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = %i[
    user
    bill_address
    ship_address
    store
    line_items
    variants
    products
    shipments
    inventory_units
    cartons
    adjustments
    line_item_adjustments
    shipment_adjustments
    all_adjustments
    order_promotions
    promotions
    payments
    valid_store_credit_payments
    return_authorizations
    return_items
    customer_returns
    reimbursements
    refunds
    state_changes
    created_by
    approver
    canceler
    number
    item_total
    total
    state
    adjustment_total
    completed_at
    payment_total
    shipment_state
    payment_state
    email
    special_instructions
    currency
    last_ip_address
    shipment_total
    additional_tax_total
    promo_total
    channel
    included_tax_total
    item_count
    approved_at
    confirmation_delivered
    guest_token
    canceled_at
    approver_name
    frontend_viewable
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

  # Overwrite this method to customize how orders are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(order)
  #   "Spree::Order ##{order.id}"
  # end
end
