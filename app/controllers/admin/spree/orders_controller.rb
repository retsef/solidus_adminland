module Admin
  class Spree::OrdersController < Admin::ApplicationController
    include AdministrateExportable::Exporter

    # Overwrite any of the RESTful controller actions to implement custom behavior
    # For example, you may want to send an email after a foo is updated.
    #
    # def update
    #   super
    #   send_foo_updated_email(requested_resource)
    # end

    def new
      user = Spree.user_class.find_by(id: params[:user_id]) if params[:user_id]
      order_importer_params = order_params
      order_importer_params[:bill_address] = user&.bill_address
      order_importer_params[:ship_address] = user&.ship_address

      resource = ::Spree::Core::Importer::Order.import(user, order_importer_params)

      redirect_to(
        after_resource_created_path(resource),
        notice: translate_with_resource('create.success')
      )
    end

    # Override this method to specify custom lookup behavior.
    # This will be used to set the resource for the `show`, `edit`, and `update`
    # actions.
    #
    def find_resource(param)
      scoped_resource.find_by!(number: param)
    end

    # The result of this lookup will be available as `requested_resource`

    # Override this if you have certain roles that require a subset
    # this will be used to set the records shown on the `index` action.
    #
    # def scoped_resource
    #   if current_user.super_admin?
    #     resource_class
    #   else
    #     resource_class.with_less_stuff
    #   end
    # end

    # Override `resource_params` if you want to transform the submitted
    # data before it's persisted. For example, the following would turn all
    # empty values into nil values. It uses other APIs such as `resource_class`
    # and `dashboard`:
    #
    # def resource_params
    #   params.require(resource_class.model_name.param_key).
    #     permit(dashboard.permitted_attributes).
    #     transform_values { |value| value == "" ? nil : value }
    # end

    # See https://administrate-prototype.herokuapp.com/customizing_controller_actions
    # for more information

    private

    def order_params
      {
        # created_by_id: try_spree_current_user.try(:id),
        frontend_viewable: false,
        store_id: current_store.try(:id)
      }.with_indifferent_access
    end
  end
end
