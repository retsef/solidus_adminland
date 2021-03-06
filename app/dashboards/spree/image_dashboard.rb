class Spree::ImageDashboard < Spree::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    id: Field::Number,
    type: Field::String,
    alt: Field::Text,
    viewable: Field::Polymorphic.with_options(classes: [Spree::Variant]),

    attachment: Field::ActiveStorage,

    position: Field::Number,
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
    position
    attachment
    alt
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = %i[
    attachment
    viewable
    type
    alt
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = %i[
    viewable
    attachment
    position
    type
    alt
  ].freeze

  FORM_ATTRIBUTES_NEW = %i[
    viewable
    position
    attachment
    alt
  ].freeze

  FORM_ATTRIBUTES_EDIT = %i[
    position
    alt
    attachment
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
