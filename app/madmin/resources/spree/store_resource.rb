class Spree::StoreResource < Madmin::Resource
  # Attributes
  attribute :id, form: false
  attribute :name
  attribute :url
  attribute :meta_description
  attribute :meta_keywords
  attribute :seo_title
  attribute :mail_from_address
  attribute :default_currency
  attribute :code
  attribute :default
  attribute :created_at, form: false
  attribute :updated_at, form: false
  attribute :cart_tax_country_iso
  attribute :available_locales
  attribute :bcc_email

  # Associations
  attribute :store_payment_methods
  attribute :payment_methods
  attribute :store_shipping_methods
  attribute :shipping_methods
  attribute :orders

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
