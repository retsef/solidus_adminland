class Spree::UserAddressResource < Madmin::Resource
  # Attributes
  attribute :id, form: false
  attribute :default
  attribute :archived
  attribute :created_at, form: false
  attribute :updated_at, form: false
  attribute :default_billing

  # Associations
  attribute :user
  attribute :address

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
