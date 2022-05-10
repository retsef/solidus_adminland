module Admin
  class Spree::Promotion::ActionsController < Spree::Promotion::BaseController
    def resource_class
      ::Spree::PromotionAction
    end

    def dashboard_class
      return super unless %w[edit update destroy].include? action_name

      "#{find_resource(params[:id]).class}Dashboard".constantize
    end

    def scoped_resource
      scoped_resource ||= resource_class.where(promotion: requested_parent_resource)

      # Administrate ransack
      @ransack_results = authorized_scope(scoped_resource).ransack(params[:q])
      @ransack_results.result(distinct: true)
    end

    def new_resource
      resource_class.new(new_resource_params)
    end

    # Overwrite any of the RESTful controller actions to implement custom behavior
    # For example, you may want to send an email after a foo is updated.
    #
    # def update
    #   super
    #   send_foo_updated_email(requested_resource)
    # end

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

    def new_resource_params
      {
        promotion: requested_parent_resource
      }
    end

    # See https://administrate-prototype.herokuapp.com/customizing_controller_actions
    # for more information
  end
end
