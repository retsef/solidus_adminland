class Spree::LegacyUserResource < Madmin::Resource
  # Attributes
  attribute :id, form: false
  attribute :crypted_password
  attribute :salt
  attribute :email
  attribute :remember_token
  attribute :remember_token_expires_at
  attribute :persistence_token
  attribute :single_access_token
  attribute :perishable_token
  attribute :login_count, form: false
  attribute :failed_login_count, form: false
  attribute :last_request_at
  attribute :current_login_at
  attribute :last_login_at
  attribute :current_login_ip
  attribute :last_login_ip
  attribute :login
  attribute :ship_address_id
  attribute :bill_address_id
  attribute :created_at, form: false
  attribute :updated_at, form: false
  attribute :openid_identifier
  attribute :spree_api_key

  # Associations
  attribute :user_addresses
  attribute :addresses
  attribute :default_user_bill_address
  attribute :bill_address
  attribute :default_user_ship_address
  attribute :ship_address
  attribute :role_users
  attribute :spree_roles
  attribute :user_stock_locations
  attribute :stock_locations
  attribute :spree_orders
  attribute :orders
  attribute :store_credits
  attribute :store_credit_events
  attribute :credit_cards
  attribute :wallet_payment_sources

  # Uncomment this to customize the display name of records in the admin area.
  # def self.display_name(record)
  #   record.name
  # end

  # Uncomment this to customize the default sort column and direction.
  # def self.default_sort_column
  #   "created_at"
  # end
  #
  # def self.default_sort_direction
  #   "desc"
  # end
end
