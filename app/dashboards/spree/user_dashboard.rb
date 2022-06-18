class Spree::UserDashboard < Spree::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    id: Field::Number,
    email: Field::Email,

    password: Field::Password,
    password_confirmation: Field::Password,

    #  crypted_password: Field::String,
    #  salt: Field::String,
    #  remember_token: Field::String,
    #  remember_token_expires_at: Field::String,
    # persistence_token: Field::String,
    #  single_access_token: Field::String,
    # perishable_token: Field::String,
    # login_count: Field::Number,
    #  failed_login_count: Field::Number,
    #  last_request_at: Field::DateTime,
    # current_login_at: Field::DateTime,
    # last_login_at: Field::DateTime,
    #  current_login_ip: Field::String,
    # last_login_ip: Field::String,

    login: Field::String,
    openid_identifier: Field::String,
    # spree_api_key: Field::String,

    # user_addresses: Field::HasMany,
    addresses: Field::HasMany,
    # default_user_bill_address: Field::HasOne,
    bill_address: Field::HasOne,
    #  default_user_ship_address: Field::HasOne,
    ship_address: Field::HasOne,

    #  role_users: Field::HasMany,
    spree_roles: Field::HasMany.with_options(filterable: true),

    # user_stock_locations: Field::HasMany,
    stock_locations: Field::HasMany,
    # spree_orders: Field::HasMany,
    orders: Field::HasMany,

    store_credits: Field::HasMany,
    # store_credit_events: Field::HasMany,
    credit_cards: Field::HasMany,
    # wallet_payment_sources: Field::HasMany,

    created_at: Field::DateTime,
    updated_at: Field::DateTime,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = %i[
    email
    bill_address
    ship_address
    orders
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = %i[
    id
    email

    addresses
    bill_address
    ship_address

    spree_roles

    stock_locations
    orders
    store_credits
    credit_cards

    created_at
    updated_at
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = %i[
    email

    password
    password_confirmation

    spree_roles
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

  # Overwrite this method to customize how legacy users are displayed
  # across all pages of the admin dashboard.
  #
  def display_resource(legacy_user)
    legacy_user.email
  end
end
