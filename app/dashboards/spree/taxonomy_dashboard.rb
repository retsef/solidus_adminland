class Spree::TaxonomyDashboard < Spree::BaseDashboard
  def display_resource(taxonomy)
    taxonomy.name.to_s
  end

  TAXON_EXCLUDED_PARAMS = %i[
    description
    permalink
    position
    taxonomy
    meta_title
    meta_description
    meta_keywords
  ].freeze

  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    id: Field::Number,
    name: Field::String,
    position: Field::Number,
    taxons: Field::NestedHasMany.with_options(class_name: 'Spree::Taxon', skip: TAXON_EXCLUDED_PARAMS),
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
    taxons
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = %i[
    name
    taxons
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = %i[
    name
    taxons
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

  # Overwrite this method to customize how taxonomies are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(taxonomy)
  #   "Spree::Taxonomy ##{taxonomy.id}"
  # end
end
