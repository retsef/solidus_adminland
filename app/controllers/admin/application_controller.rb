# All Administrate controllers inherit from this
# `Administrate::ApplicationController`, making it the ideal place to put
# authentication logic or other before_actions.
#
# If you want to add pagination or other controller-level concerns,
# you're free to overwrite the RESTful controller actions.

module Admin
  class ApplicationController < Administrate::ApplicationController
    prepend AdministrateRansack::Searchable
    helper 'active_link_to'

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
  end
end
