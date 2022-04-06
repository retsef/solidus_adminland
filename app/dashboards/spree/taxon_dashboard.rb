class Spree::TaxonDashboard < Spree::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    id: Field::Number,
    name: Field::String,
    description: Field::Text,
    taxonomy: Field::BelongsTo.with_options(class_name: 'Spree::Taxonomy'),
    classifications: Field::HasMany.with_options(class_name: 'Spree::Classification'),
    products: Field::HasMany.with_options(class_name: 'Spree::Product'),
    # icon_attachment: Field::HasOne,
    # icon_blob: Field::HasOne,
    # icon_file_name: Field::String,
    # icon_content_type: Field::String,
    # icon_file_size: Field::Number,
    # icon_updated_at: Field::DateTime,
    # icon: Field::Image,
    icon: Field::ActiveStorage,
    position: Field::Number,
    permalink: Field::String,
    # lft: Field::Number,
    # rgt: Field::Number,
    # depth: Field::Number,
    meta_title: Field::String,
    meta_description: Field::Text,
    meta_keywords: Field::String,
    created_at: Field::DateTime,
    updated_at: Field::DateTime
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = %i[
    name
    description
    taxonomy
    products
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = %i[
    name
    description
    permalink
    icon
    meta_title
    meta_description
    meta_keywords
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = %i[
    name
    description
    permalink
    icon
    meta_title
    meta_description
    meta_keywords
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

  # Overwrite this method to customize how taxons are displayed
  # across all pages of the admin dashboard.
  #
  def display_resource(taxon)
    taxon.name
  end
end
