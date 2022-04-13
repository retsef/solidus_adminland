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
    include Admin::Variant

    prepend AdministrateRansack::Searchable

    helper 'filters'
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

    def create
      resource = new_resource
      resource.assign_attributes(resource_params)
      authorize_resource(resource)

      if resource.save
        redirect_to(after_resource_created_path(resource), notice: translate_with_resource('create.success'), status: :see_other)
      else
        render :new, locals: {
          page: Administrate::Page::Form.new(dashboard, resource)
        }, status: :unprocessable_entity
      end
    end

    def update
      if requested_resource.update(resource_params)
        redirect_to(after_resource_updated_path(requested_resource), notice: translate_with_resource('update.success'), status: :see_other)
      else
        render :edit, locals: {
          page: Administrate::Page::Form.new(dashboard, requested_resource),
        }, status: :unprocessable_entity
      end
    end

    def destroy
      delete_method = requested_resource.respond_to?(:discard) ? :discard : :destroy

      if requested_resource.send(delete_method)
        flash[:notice] = translate_with_resource('destroy.success')
      else
        flash[:error] = requested_resource.errors.full_messages.join('<br/>')
      end

      redirect_to after_resource_destroyed_path(requested_resource), status: :see_other
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

    def resource_params
      params.require(resource_class.model_name.param_key)
            .permit(dashboard.permitted_attributes)
            .transform_values { |v| read_param_value(v) }
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
