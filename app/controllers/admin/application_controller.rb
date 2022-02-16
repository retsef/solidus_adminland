# All Administrate controllers inherit from this
# `Administrate::ApplicationController`, making it the ideal place to put
# authentication logic or other before_actions.
#
# If you want to add pagination or other controller-level concerns,
# you're free to overwrite the RESTful controller actions.

module Admin
  class ApplicationController < Administrate::ApplicationController
    # Solidus Core
    include ::Spree::Core::ControllerHelpers::Store

    prepend AdministrateRansack::Searchable

    helper 'local_time'
    helper 'active_link_to'
    helper 'alert'

    before_action :authenticate_admin

    default_form_builder Admin::FormBuilder

    def authenticate_admin
      # TODO: Add authentication logic here.
    end

    # Override this value to specify the number of elements to display at a time
    # on index pages. Defaults to 15.
    def records_per_page
      params[:per_page] || 15
    end

    def authorize_resource(resource)
      resource
      # authorize! action_name, resource
    end

    # Copied from https://github.com/thoughtbot/administrate/blob/v0.17.0/app/controllers/administrate/application_controller.rb#L5
    def index
      authorize_resource(resource_class)
      search_term = params[:search].to_s.strip
      resources = filter_resources(scoped_resource, search_term: search_term)
      resources = apply_collection_includes(resources)
      resources = order.apply(resources)
      resources = resources.page(params[:_page]).per(records_per_page)
      page = Administrate::Page::Collection.new(dashboard, order: order)

      render locals: {
        resources: resources,
        search_term: search_term,
        page: page,
        show_search_bar: show_search_bar?,
        show_filters: show_filters?
      }
    end

    private

    def filter_resources(resources, search_term:)
      Administrate::Search.new(
        resources,
        dashboard,
        search_term
      ).run
    end

    def show_filters?
      dashboard.attribute_types_for(
        dashboard.all_attributes
      ).any? { |_name, attribute| attribute.filterable? }
    end

    # TODO: create a custom resource_resolver for nested resources
    delegate :resource_title, to: :resource_resolver
    helper_method :resource_title

    def translate_with_resource(key)
      t(
        "administrate.controller.#{key}",
        resource: resource_title
      )
    end
  end
end
