class Spree::Promotion::Rules::UserRoleDashboard < Spree::Promotion::Rules::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    id: Field::Number,
    type: Field::String,
    code: Field::String,
    promotion: Field::BelongsTo,
    product_group_id: Field::Number,
    preferences: Field::Text,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,

    preferred_role_ids: Field::Select.with_options(collection: Spree::Role.all.map { |ur| [ur.name, ur.id] }, multiple: true),
    preferred_match_policy: Field::Select.with_options(collection: Spree::Promotion::Rules::Taxon::MATCH_POLICIES),
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = %i[
    promotion
    type
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = %i[
    id
    promotion
    type
    code
    product_group_id
    preferences
    created_at
    updated_at
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = %i[
    preferred_match_policy
    preferred_role_ids
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

  # Overwrite this method to customize how item totals are displayed
  # across all pages of the admin dashboard.
  #
  def display_resource(user_role)
    "#{user_role.preferred_match_policy} of #{user_role.preferred_role_ids.size} user roles"
  end
end
