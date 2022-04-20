class Spree::PaymentMethodDashboard < Spree::BaseDashboard
  def self.payment_methods
    Rails.application.config.spree.payment_methods
  end

  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    id: Field::Number,
    type: Field::Select.with_options(collection: payment_methods.map { |rule| [rule.real_model_name.human, rule.name] }),
    name: Field::String,
    description: Field::Text,
    active: Field::Boolean,
    payments: Field::HasMany.with_options(class_name: 'Spree::Payment'),
    credit_cards: Field::HasMany.with_options(class_name: 'Spree::CreditCard'),
    stores: Field::HasMany.with_options(class_name: 'Spree::Store'),
    auto_capture: Field::Boolean,

    preference_source: Field::Select.with_options(collection: [[I18n.t('spree.preference_source_none'), nil]] + Spree::PaymentMethod.available_preference_sources),

    # preferences: Field::Text,
    preferred_server: Field::String,
    preferred_test_mode: Field::Boolean,

    position: Field::Number,
    available_to_users: Field::Boolean,
    available_to_admin: Field::Boolean,
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
    description
    active
    available_to_users
    available_to_admin
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = %i[
    id
    type
    name
    description
    active
    auto_capture
    preference_source
    preferred_server
    preferred_test_mode
    position
    available_to_users
    available_to_admin
    payments
    credit_cards
    stores
    deleted_at
    created_at
    updated_at
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = %i[
    type
    name
    description
    active
    stores
    auto_capture
    available_to_users
    available_to_admin
    preference_source
    preferred_server
    preferred_test_mode
  ].freeze

  FORM_ATTRIBUTES_EDIT = %i[
    name
    description
    active
    stores
    auto_capture
    available_to_users
    available_to_admin
    preference_source
    preferred_server
    preferred_test_mode
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

  # Overwrite this method to customize how payment methods are displayed
  # across all pages of the admin dashboard.
  #
  def display_resource(payment_method)
    payment_method.name
  end
end
