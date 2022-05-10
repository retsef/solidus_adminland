class Spree::Order::BillAddressDashboard < Spree::Order::AddressDashboard
  def self.model
    ::Spree::Address
  end

  def resource_class
    self.class.model
  end

  def resource_class_name
    resource_class.name.to_s
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
    company: Field::String,
    address1: Field::String,
    address2: Field::String,
    city: Field::String,
    zipcode: Field::String,
    phone: Field::String,
    state_name: Field::String,
    alternative_phone: Field::String,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
    country: Field::BelongsTo,
    state: Field::BelongsTo,
  }.freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = %i[
    name
    company
    address1
    address2
    city
    zipcode
    state
    state_name
    country
    phone
    alternative_phone
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = %i[
    name
    company
    address1
    address2
    city
    zipcode
    state
    state_name
    country
    phone
    alternative_phone
  ].freeze

  # Overwrite this method to customize how addresses are displayed
  # across all pages of the admin dashboard.
  #
  def display_resource(address)
    "BIlling address ##{address.id}"
  end
end
