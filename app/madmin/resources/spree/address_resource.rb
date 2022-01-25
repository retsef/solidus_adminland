class Spree::AddressResource < Madmin::Resource
  # Attributes
  attribute :id, form: false
  attribute :address1
  attribute :address2
  attribute :city
  attribute :zipcode
  attribute :phone
  attribute :state_name
  attribute :alternative_phone
  attribute :company
  attribute :created_at, form: false
  attribute :updated_at, form: false
  attribute :name

  # Associations
  attribute :country
  attribute :state

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
