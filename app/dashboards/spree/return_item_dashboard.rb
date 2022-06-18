class Spree::ReturnItemDashboard < Spree::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    return_authorization: Field::BelongsTo,
    inventory_unit: Field::BelongsTo,
    exchange_variant: Field::BelongsTo,
    exchange_inventory_unit: Field::BelongsTo,
    customer_return: Field::BelongsTo,
    reimbursement: Field::BelongsTo,
    preferred_reimbursement_type: Field::BelongsTo,
    override_reimbursement_type: Field::BelongsTo,
    return_reason: Field::BelongsTo,
    id: Field::Number,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
    amount: Field::String.with_options(searchable: false),
    included_tax_total: Field::String.with_options(searchable: false),
    additional_tax_total: Field::String.with_options(searchable: false),
    reception_status: Field::String,
    acceptance_status: Field::String,
    acceptance_status_errors: Field::Text,
    resellable: Field::Boolean,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = %i[
    return_authorization
    inventory_unit
    exchange_variant
    exchange_inventory_unit
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = %i[
    return_authorization
    inventory_unit
    exchange_variant
    exchange_inventory_unit
    customer_return
    reimbursement
    preferred_reimbursement_type
    override_reimbursement_type
    return_reason
    id
    created_at
    updated_at
    amount
    included_tax_total
    additional_tax_total
    reception_status
    acceptance_status
    acceptance_status_errors
    resellable
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = %i[
    return_authorization
    inventory_unit
    exchange_variant
    exchange_inventory_unit
    customer_return
    reimbursement
    preferred_reimbursement_type
    override_reimbursement_type
    return_reason
    amount
    included_tax_total
    additional_tax_total
    reception_status
    acceptance_status
    acceptance_status_errors
    resellable
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

  # Overwrite this method to customize how return items are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(return_item)
  #   "Spree::ReturnItem ##{return_item.id}"
  # end
end
