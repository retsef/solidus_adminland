class Spree::ImageDashboard < Spree::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    viewable: Field::Polymorphic,
    attachment_attachment: Field::HasOne,
    attachment_blob: Field::HasOne,
    id: Field::Number,
    attachment_width: Field::Number,
    attachment_height: Field::Number,
    attachment_file_size: Field::Number,
    position: Field::Number,
    attachment_content_type: Field::String,
    attachment_file_name: Field::String,
    type: Field::String,
    attachment_updated_at: Field::DateTime,
    alt: Field::Text,
    created_at: Field::DateTime,
    updated_at: Field::DateTime
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = %i[
    viewable
    attachment_attachment
    attachment_blob
    id
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = %i[
    viewable
    attachment_attachment
    attachment_blob
    id
    attachment_width
    attachment_height
    attachment_file_size
    position
    attachment_content_type
    attachment_file_name
    type
    attachment_updated_at
    alt
    created_at
    updated_at
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = %i[
    viewable
    attachment_attachment
    attachment_blob
    attachment_width
    attachment_height
    attachment_file_size
    position
    attachment_content_type
    attachment_file_name
    type
    attachment_updated_at
    alt
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

  # Overwrite this method to customize how images are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(image)
  #   "Spree::Image ##{image.id}"
  # end
end
