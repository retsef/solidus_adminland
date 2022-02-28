class Spree::PromotionDashboard < Spree::BaseDashboard
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

    # per_code_usage_limit: Field::Number,
    # apply_automatically: Field::Boolean,

    # activation_type: Field::Select.with_options(collection: ['auto', 'single_code', 'multiple_codes']),
    # single_code: Field::String,
    # promotion_code_batch: Field::HasOne.with_options(class_name: 'Spree::PromotionCodeBatch'),

    match_policy: Field::Select.with_options(collection: Spree::Promotion::MATCH_POLICIES),
    advertise: Field::Boolean,
    path: Field::String,

    codes: Field::HasMany.with_options(class_name: 'Spree::PromotionCode', skip: :promotion),
    promotion_codes: Field::NestedHasMany.with_options(class_name: 'Spree::PromotionCode', skip: :promotion),
    promotion_category: Field::BelongsTo.with_options(class_name: 'Spree::PromotionCategory', filterable: true),
    promotion_rules: Field::NestedHasMany.with_options(class_name: 'Spree::PromotionRule', skip: %i[promotion]),
    promotion_actions: Field::NestedHasMany.with_options(class_name: 'Spree::PromotionAction', skip: %i[promotion]),

    # order_promotions: Field::HasMany,
    # orders: Field::HasMany.with_options(class_name: 'Spree::Order'),
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
    description
    starts_at
    expires_at
    usage_limit
    codes
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = %i[
    name
    description
    starts_at
    expires_at

    usage_limit
    promotion_category
    promotion_codes
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = %i[
    name
    description
    starts_at
    expires_at
    usage_limit

    promotion_category
    promotion_codes

    match_policy
    promotion_rules
    promotion_actions
  ].freeze

  FORM_ATTRIBUTES_NEW = %i[
    name
    description
    starts_at
    expires_at
    usage_limit

    promotion_codes
  ].freeze

  FORM_ATTRIBUTES_EDIT = %i[
    name
    description
    starts_at
    expires_at
    usage_limit

    match_policy
    promotion_rules
    promotion_actions
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
  def display_resource(promotion)
    promotion.name
  end
end
