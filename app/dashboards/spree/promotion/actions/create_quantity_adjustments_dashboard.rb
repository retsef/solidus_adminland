class Spree::Promotion::Actions::CreateQuantityAdjustmentsDashboard < Spree::Promotion::Actions::BaseDashboard
  def self.calculators
    Rails.application.config.spree.calculators.promotion_actions_create_quantity_adjustments
  end

  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    id: Field::Number,
    position: Field::Number,
    type: Field::String,
    promotion: Field::BelongsTo,

    calculator: Field::HasOne, # .with_options(class_name: 'Spree::Calculator'),
    calculator_type: Field::Select.with_options(collection: calculators.map { |rule| [rule.model_name.human, rule.name] }),

    adjustments: Field::HasMany,
    line_item_actions: Field::HasMany,
    line_items: Field::HasMany,

    preferences: Field::Text,
    deleted_at: Field::DateTime,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = %i[
    promotion
    calculator
    adjustments
    line_items
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = %i[
    id
    position
    type
    promotion
    calculator
    adjustments
    line_items
    deleted_at
    preferences
    created_at
    updated_at
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = %i[
    calculator
    calculator_type
  ].freeze

  FORM_ATTRIBUTES_NEW = %i[
    calculator_type
  ].freeze

  FORM_ATTRIBUTES_EDIT = %i[
    calculator
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

  # Overwrite this method to customize how create quantity adjustments are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(create_quantity_adjustments)
  #   "Spree::Promotion::Actions::CreateQuantityAdjustments ##{create_quantity_adjustments.id}"
  # end
end
