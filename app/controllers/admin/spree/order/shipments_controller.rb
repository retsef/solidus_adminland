module Admin
  class Spree::Order::ShipmentsController < Spree::Order::BaseController
    def resource_class
      ::Spree::Shipment
    end

    # Overwrite any of the RESTful controller actions to implement custom behavior
    # For example, you may want to send an email after a foo is updated.
    #
    # def update
    #   super
    #   send_foo_updated_email(requested_resource)
    # end

    def update
      if requested_resource.update(resource_params)
        requested_resource.select_shipping_method(shipping_method) if shipping_method.present?
        requested_parent_resource.recalculate

        redirect_to(after_resource_updated_path(requested_resource), notice: translate_with_resource('update.success'), status: :see_other)
      else
        render :edit, locals: {
          page: Administrate::Page::Form.new(dashboard, requested_resource),
        }, status: :unprocessable_entity
      end
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

    def shipping_method
      ::Spree::ShippingMethod.find_by(id: params.require(resource_class.model_name.param_key)[:shipping_method])
    end
  end
end
