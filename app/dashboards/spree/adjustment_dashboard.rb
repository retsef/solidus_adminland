class Spree::AdjustmentDashboard < Spree::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    id: Field::Number,
    amount: Field::String.with_options(searchable: false),
    label: Field::String,
    eligible: Field::Boolean,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
    included: Field::Boolean,
    finalized: Field::Boolean,
    adjustable: Field::Polymorphic,
    source: Field::Polymorphic,
    order: Field::BelongsTo,
    promotion_code: Field::BelongsTo,
    adjustment_reason: Field::BelongsTo
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = %i[
    adjustable
    source
    order
    promotion_code
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = %i[
    adjustable
    source
    order
    promotion_code
    adjustment_reason
    id
    amount
    label
    eligible
    created_at
    updated_at
    included
    finalized
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = %i[
    adjustable
    source
    order
    promotion_code
    adjustment_reason
    amount
    label
    eligible
    included
    finalized
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

  # Overwrite this method to customize how adjustments are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(adjustment)
  #   "Spree::Adjustment ##{adjustment.id}"
  # end
end