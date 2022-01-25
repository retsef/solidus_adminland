class Spree::AssetResource < Madmin::Resource
  # Attributes
  attribute :id, form: false
  attribute :attachment_width
  attribute :attachment_height
  attribute :attachment_file_size
  attribute :position
  attribute :attachment_content_type
  attribute :attachment_file_name
  attribute :type
  attribute :attachment_updated_at
  attribute :alt
  attribute :created_at, form: false
  attribute :updated_at, form: false

  # Associations
  attribute :viewable

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
