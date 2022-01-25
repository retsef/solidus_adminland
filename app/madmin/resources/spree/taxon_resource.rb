class Spree::TaxonResource < Madmin::Resource
  # Attributes
  attribute :id, form: false
  attribute :position
  attribute :name
  attribute :permalink
  attribute :lft
  attribute :rgt
  attribute :icon_file_name
  attribute :icon_content_type
  attribute :icon_file_size
  attribute :icon_updated_at
  attribute :description
  attribute :created_at, form: false
  attribute :updated_at, form: false
  attribute :meta_title
  attribute :meta_description
  attribute :meta_keywords
  attribute :depth
  attribute :icon, index: false

  # Associations
  attribute :parent
  attribute :children
  attribute :taxonomy
  attribute :classifications
  attribute :products
  attribute :promotion_rule_taxons
  attribute :promotion_rules

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
