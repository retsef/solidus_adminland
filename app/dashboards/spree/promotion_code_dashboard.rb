class Spree::PromotionCodeDashboard < Spree::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    id: Field::Number,
    value: Field::String,
    promotion: Field::BelongsTo.with_options(class_name: 'Spree::Promotion'),
    adjustments: Field::HasMany.with_options(class_name: 'Spree::Adjustment'),
    # promotion_code_batch: Field::BelongsTo,
    usage_count: Field::Number,
    usage_limit: Field::Number,
    created_at: Field::DateTime,
    updated_at: Field::DateTime
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = %i[
    value
    promotion
    usage_count
    usage_limit
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = %i[
    value
    promotion
    adjustments
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = %i[
    value
    promotion
  ].freeze

  FORM_ATTRIBUTES_NEW = %i[
    value
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

  # Overwrite this method to customize how promotion codes are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(promotion_code)
  #   "Spree::PromotionCode ##{promotion_code.id}"
  # end
end
