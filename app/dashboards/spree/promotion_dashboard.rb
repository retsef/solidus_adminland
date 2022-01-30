require "administrate/base_dashboard"

class Spree::PromotionDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    promotion_category: Field::BelongsTo,
    promotion_rules: Field::HasMany,
    promotion_actions: Field::HasMany,
    order_promotions: Field::HasMany,
    orders: Field::HasMany,
    codes: Field::HasMany,
    promotion_code_batches: Field::HasMany,
    id: Field::Number,
    description: Field::String,
    expires_at: Field::DateTime,
    starts_at: Field::DateTime,
    name: Field::String,
    type: Field::String,
    usage_limit: Field::Number,
    match_policy: Field::String,
    advertise: Field::Boolean,
    path: Field::String,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
    per_code_usage_limit: Field::Number,
    apply_automatically: Field::Boolean,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = %i[
    promotion_category
    promotion_rules
    promotion_actions
    order_promotions
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = %i[
    promotion_category
    promotion_rules
    promotion_actions
    order_promotions
    orders
    codes
    promotion_code_batches
    id
    description
    expires_at
    starts_at
    name
    type
    usage_limit
    match_policy
    advertise
    path
    created_at
    updated_at
    per_code_usage_limit
    apply_automatically
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = %i[
    promotion_category
    promotion_rules
    promotion_actions
    order_promotions
    orders
    codes
    promotion_code_batches
    description
    expires_at
    starts_at
    name
    type
    usage_limit
    match_policy
    advertise
    path
    per_code_usage_limit
    apply_automatically
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

  # Overwrite this method to customize how promotions are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(promotion)
  #   "Spree::Promotion ##{promotion.id}"
  # end
end
