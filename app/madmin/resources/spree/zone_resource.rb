class Spree::ZoneResource < Madmin::Resource
  # Attributes
  attribute :id, form: false
  attribute :name
  attribute :description
  attribute :zone_members_count, form: false
  attribute :created_at, form: false
  attribute :updated_at, form: false

  # Associations
  attribute :zone_members
  attribute :tax_rates
  attribute :countries
  attribute :states
  attribute :shipping_method_zones
  attribute :shipping_methods

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
