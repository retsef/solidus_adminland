class Spree::PaymentMethod::StoreCreditDashboard < Spree::PaymentMethodDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  # ATTRIBUTE_TYPES = Spree::PaymentMethodDashboard::ATTRIBUTE_TYPES

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  # COLLECTION_ATTRIBUTES = Spree::PaymentMethodDashboard::COLLECTION_ATTRIBUTES

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  # SHOW_PAGE_ATTRIBUTES = Spree::PaymentMethodDashboard::SHOW_PAGE_ATTRIBUTES

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  # FORM_ATTRIBUTES = Spree::PaymentMethodDashboard::FORM_ATTRIBUTES

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
  # COLLECTION_FILTERS = {}.freeze

  # Overwrite this method to customize how store credits are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(store_credit)
  #   "Spree::PaymentMethod::StoreCredit ##{store_credit.id}"
  # end
end
