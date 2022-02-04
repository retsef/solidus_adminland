class Spree::PromotionDashboard < Spree::BaseDashboard

  def display_resource(resource)
    "#{resource.name}"
  end
  
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    id: Field::Number,
    name: Field::String,
    type: Field::String,
    description: Field::Text,
    starts_at: Field::DateTime,
    expires_at: Field::DateTime,
    usage_limit: Field::Number,
    match_policy: Field::Select.with_options(collection: Spree::Promotion::MATCH_POLICIES),
    advertise: Field::Boolean,
    path: Field::String,
    #  promotion_code_batches: Field::HasMany,
    per_code_usage_limit: Field::Number,
    apply_automatically: Field::Boolean,
    promotion_category: Field::BelongsTo.with_options(class_name: 'Spree::PromotionCategory', filterable: true),
    promotion_rules: Field::HasMany.with_options(class_name: 'Spree::PromotionRule'),
    promotion_actions: Field::HasMany.with_options(class_name: 'Spree::PromotionAction'),
    # order_promotions: Field::HasMany,
    orders: Field::HasMany.with_options(class_name: 'Spree::Order'),
    codes: Field::HasMany.with_options(class_name: 'Spree::PromotionCode'),
    created_at: Field::DateTime,
    updated_at: Field::DateTime
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = %i[
    id
    name
    description
    type
    starts_at
    expires_at
    per_code_usage_limit
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = %i[
    id
    name
    type
    description
    starts_at
    expires_at
    usage_limit
    match_policy
    advertise
    path
    per_code_usage_limit
    apply_automatically
    promotion_category
    promotion_rules
    promotion_actions
    orders
    codes
    created_at
    updated_at
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = %i[
    name
    description
    starts_at
    expires_at
    type
    usage_limit
    match_policy
    advertise
    path
    per_code_usage_limit
    apply_automatically
    promotion_category
    promotion_rules
    promotion_actions
    orders
    codes
  ].freeze

  FORM_ATTRIBUTES_NEW = %i[
    name
    description
    starts_at
    expires_at
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
