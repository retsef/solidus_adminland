class Spree::StoreDashboard < Spree::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    id: Field::Number,
    name: Field::String,
    url: Field::String,
    code: Field::String,
    default: Field::Boolean,
    bcc_email: Field::Email,
    mail_from_address: Field::Email,
    seo_title: Field::String,
    meta_description: Field::Text,
    meta_keywords: Field::Text,

    default_currency: Field::Select.with_options(collection: Spree::Config.available_currencies.map(&:iso_code), selected: Spree::Config.currency, searchable: false),
    cart_tax_country_iso: Field::Select.with_options(collection: Spree::Country.all.map { |c| [c.name, c.iso] }),

    available_locales: Field::Select.with_options(collection: Spree.i18n_available_locales, multiple: true, searchable: false),

    # store_payment_methods: Field::HasMany,
    payment_methods: Field::HasMany.with_options(class_name: 'Spree::PaymentMethod'),
    # store_shipping_methods: Field::HasMany,
    shipping_methods: Field::HasMany.with_options(class_name: 'Spree::ShippingMethod'),

    orders: Field::HasMany.with_options(class_name: 'Spree::Order'),

    created_at: Field::DateTime,
    updated_at: Field::DateTime
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = %i[
    code
    name
    url
    default
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = %i[
    name
    url
    code
    default

    mail_from_address
    bcc_email
    default_currency
    cart_tax_country_iso

    payment_methods
    shipping_methods

    seo_title
    meta_description
    meta_keywords
    available_locales
    created_at
    updated_at
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = %i[
    name
    url
    code
    default
    cart_tax_country_iso

    mail_from_address
    default_currency
    available_locales
    bcc_email

    seo_title
    meta_description
    meta_keywords
  ].freeze

  FORM_ATTRIBUTES_NEW = %i[
    name
    url
    code
    default
    cart_tax_country_iso

    mail_from_address
    default_currency
    available_locales
    bcc_email
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

  # Overwrite this method to customize how stores are displayed
  # across all pages of the admin dashboard.
  #
  def display_resource(store)
    "#{store.name} - #{store.code}"
  end
end
