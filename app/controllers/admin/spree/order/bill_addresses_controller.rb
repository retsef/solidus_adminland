module Admin
  class Spree::Order::BillAddressesController < Spree::Order::BaseController
    def resource_class
      ::Spree::Address
    end

    # Overwrite any of the RESTful controller actions to implement custom behavior
    # For example, you may want to send an email after a foo is updated.
    #
    def update
      super

      requested_parent_resource.update(bill_address_id: requested_resource.id)
    end

    # Override this method to specify custom lookup behavior.
    # This will be used to set the resource for the `show`, `edit`, and `update`
    # actions.
    #
    # def find_resource(param)
    #   Foo.find_by!(slug: param)
    # end

    private

    # The result of this lookup will be available as `requested_resource`

    # Override this if you have certain roles that require a subset
    # this will be used to set the records shown on the `index` action.

    def scoped_resource
      scoped_resource ||= resource_class.where(id: requested_parent_resource.bill_address_id)

      # Administrate ransack
      @ransack_results = authorized_scope(scoped_resource).ransack(params[:q])
      @ransack_results.result(distinct: true)
    end

    def find_resource(_params)
      scoped_resource.first || resource_class.new
    end

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
  end
end
