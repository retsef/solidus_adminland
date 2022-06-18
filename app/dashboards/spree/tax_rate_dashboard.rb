class Spree::TaxRateDashboard < Spree::BaseDashboard
  def self.calculators
    Rails.application.config.spree.calculators.tax_rates
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
    amount: Field::String.with_options(searchable: false),
    included_in_price: Field::Boolean,
    show_rate_in_label: Field::Boolean,
    starts_at: Field::DateTime,
    expires_at: Field::DateTime,

    calculator: Field::HasOne, # .with_options(class_name: 'Spree::Calculator'),
    calculator_type: Field::Select.with_options(collection: calculators.map { |rule| [rule.model_name.human, rule.name] }),

    zone: Field::BelongsTo.with_options(class_name: 'Spree::Zone'),
    tax_categories: Field::HasMany.with_options(class_name: 'Spree::TaxCategory'),
    #  adjustments: Field::HasMany.with_options(class_name: 'Spree::Adjustment'),
    # shipping_rate_taxes: Field::HasMany,

    deleted_at: Field::DateTime,
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
    zone
    starts_at
    expires_at
    amount
    included_in_price
    show_rate_in_label
    tax_categories
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = %i[
    name
    starts_at
    expires_at
    amount
    show_rate_in_label
    included_in_price
    tax_categories
    zone
    calculator
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = %i[
    name

    amount
    zone
    tax_categories

    included_in_price
    show_rate_in_label

    calculator
    calculator_type

    starts_at
    expires_at
  ].freeze

  FORM_ATTRIBUTES_NEW = %i[
    name

    amount
    zone
    tax_categories

    included_in_price
    show_rate_in_label

    calculator_type

    starts_at
    expires_at
  ].freeze

  FORM_ATTRIBUTES_EDIT = %i[
    name

    amount
    zone
    tax_categories

    included_in_price
    show_rate_in_label

    calculator

    starts_at
    expires_at
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

  # Overwrite this method to customize how tax rates are displayed
  # across all pages of the admin dashboard.
  #
  def display_resource(tax_rate)
    tax_rate.name
  end
end
