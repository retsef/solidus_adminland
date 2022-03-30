class Spree::UserDashboard < Spree::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    user_addresses: Field::HasMany,
    addresses: Field::HasMany,
    default_user_bill_address: Field::HasOne,
    bill_address: Field::HasOne,
    default_user_ship_address: Field::HasOne,
    ship_address: Field::HasOne,
    role_users: Field::HasMany,
    spree_roles: Field::HasMany,
    user_stock_locations: Field::HasMany,
    stock_locations: Field::HasMany,
    spree_orders: Field::HasMany,
    orders: Field::HasMany,
    store_credits: Field::HasMany,
    store_credit_events: Field::HasMany,
    credit_cards: Field::HasMany,
    wallet_payment_sources: Field::HasMany,
    id: Field::Number,
    crypted_password: Field::String,
    salt: Field::String,
    email: Field::Email,
    remember_token: Field::String,
    remember_token_expires_at: Field::String,
    persistence_token: Field::String,
    single_access_token: Field::String,
    perishable_token: Field::String,
    login_count: Field::Number,
    failed_login_count: Field::Number,
    last_request_at: Field::DateTime,
    current_login_at: Field::DateTime,
    last_login_at: Field::DateTime,
    current_login_ip: Field::String,
    last_login_ip: Field::String,
    login: Field::String,
    ship_address_id: Field::Number,
    bill_address_id: Field::Number,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
    openid_identifier: Field::String,
    spree_api_key: Field::String
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = %i[
    user_addresses
    addresses
    default_user_bill_address
    bill_address
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = %i[
    user_addresses
    addresses
    default_user_bill_address
    bill_address
    default_user_ship_address
    ship_address
    role_users
    spree_roles
    user_stock_locations
    stock_locations
    spree_orders
    orders
    store_credits
    store_credit_events
    credit_cards
    wallet_payment_sources
    id
    crypted_password
    salt
    email
    remember_token
    remember_token_expires_at
    persistence_token
    single_access_token
    perishable_token
    login_count
    failed_login_count
    last_request_at
    current_login_at
    last_login_at
    current_login_ip
    last_login_ip
    login
    ship_address_id
    bill_address_id
    created_at
    updated_at
    openid_identifier
    spree_api_key
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = %i[
    user_addresses
    addresses
    default_user_bill_address
    bill_address
    default_user_ship_address
    ship_address
    role_users
    spree_roles
    user_stock_locations
    stock_locations
    spree_orders
    orders
    store_credits
    store_credit_events
    credit_cards
    wallet_payment_sources
    crypted_password
    salt
    email
    remember_token
    remember_token_expires_at
    persistence_token
    single_access_token
    perishable_token
    login_count
    failed_login_count
    last_request_at
    current_login_at
    last_login_at
    current_login_ip
    last_login_ip
    login
    ship_address_id
    bill_address_id
    openid_identifier
    spree_api_key
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
  # def display_resource(legacy_user)
  #   "Spree::LegacyUser ##{legacy_user.id}"
  # end
end
