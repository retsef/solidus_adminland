class Spree::OrderDashboard < Spree::BaseDashboard
  STATE_CLASSES = {
    pending: 'warning',
    confirmed: 'info',
    purchased: 'success',
    declined: 'error',
    deferred: 'secondary',
  }

  SHIPMENT_STATE_CLASSES = {
    pending: 'warning',
    confirmed: 'info',
    purchased: 'success',
    declined: 'error',
    deferred: 'secondary',
  }

  PAYMENT_STATE_CLASSES = {
    pending: 'warning',
    confirmed: 'info',
    purchased: 'success',
    declined: 'error',
    deferred: 'secondary',
  }

  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    id: Field::Number,
    number: Field::String,
    email: Field::String,
    # user: Field::BelongsTo,

    bill_address: Field::BelongsTo.with_options(class_name: 'Spree::Address'),
    ship_address: Field::BelongsTo.with_options(class_name: 'Spree::Address'),

    state: Field::String.with_options(filterable: true, states: STATE_CLASSES, default: 'warning'),
    shipment_state: Field::String.with_options(filterable: true, states: SHIPMENT_STATE_CLASSES, default: 'warning'),
    payment_state: Field::String.with_options(filterable: true, states: PAYMENT_STATE_CLASSES, default: 'warning'),

    store: Field::BelongsTo.with_options(class_name: 'Spree::Store', filterable: true),

    line_items: Field::NestedHasMany.with_options(class_name: 'Spree::LineItem', skip: :order),
    variants: Field::HasMany.with_options(class_name: 'Spree::Variant'),
    products: Field::HasMany.with_options(class_name: 'Spree::Product'),
    shipments: Field::HasMany.with_options(class_name: 'Spree::Shipment'),

    inventory_units: Field::HasMany.with_options(class_name: 'Spree::InventoryUnit'),

    cartons: Field::HasMany.with_options(class_name: 'Spree::Carton'),
    adjustments: Field::HasMany.with_options(class_name: 'Spree::Adjustment'),
    # all_adjustments: Field::HasMany,

    # line_item_adjustments: Field::HasMany,
    # shipment_adjustments: Field::HasMany,

    # order_promotions: Field::HasMany,
    promotions: Field::HasMany.with_options(class_name: 'Spree::Promotion'),

    payments: Field::HasMany.with_options(class_name: 'Spree::Payment'),

    # valid_store_credit_payments: Field::HasMany,
    # return_authorizations: Field::HasMany,
    # return_items: Field::HasMany,
    # customer_returns: Field::HasMany,
    # reimbursements: Field::HasMany,
    # refunds: Field::HasMany,
    # state_changes: Field::HasMany,

    # approver: Field::BelongsTo,
    # canceler: Field::BelongsTo,

    total: Field::Money.with_options(searchable: false),
    item_total: Field::Money.with_options(searchable: false),
    additional_tax_total: Field::Money.with_options(searchable: false),
    shipment_total: Field::Money.with_options(searchable: false),
    adjustment_total: Field::Money.with_options(searchable: false),
    payment_total: Field::Money.with_options(searchable: false),
    currency: Field::String,

    completed_at: Field::DateTime.with_options(filterable: true),
    channel: Field::String,

    special_instructions: Field::Text,

    # shipment_total: Field::String.with_options(searchable: false),
    # additional_tax_total: Field::String.with_options(searchable: false),
    # promo_total: Field::String.with_options(searchable: false),
    # included_tax_total: Field::String.with_options(searchable: false),
    # item_count: Field::Number,

    approved_at: Field::DateTime,
    confirmation_delivered: Field::Boolean,

    created_by: Field::BelongsTo,
    guest_token: Field::String,
    canceled_at: Field::DateTime,
    approver_name: Field::String,
    frontend_viewable: Field::Boolean,

    last_ip_address: Field::String,
    created_at: Field::DateTime,
    updated_at: Field::DateTime
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = %i[
    number
    email
    state
    payment_state
    shipment_state
    variants
    total
    completed_at
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = %i[
    number
    email
    state
    item_total
    shipment_total
    additional_tax_total
    adjustment_total
    payment_total
    total
    completed_at
  ].freeze
  ## line_items
  ## shipments
  ## cartons
  ## adjustments
  ## promotions
  ## payments

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = %i[
    number
    email
    bill_address
    ship_address
    line_items
    shipments
    cartons
    adjustments
    promotions
    payments
  ].freeze

  FORM_ATTRIBUTES_NEW = %i[
    email
    line_items
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
