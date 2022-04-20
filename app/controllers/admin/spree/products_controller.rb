module Admin
  class Spree::ProductsController < Admin::ApplicationController
    include AdministrateExportable::Exporter

    # Overwrite any of the RESTful controller actions to implement custom behavior
    # For example, you may want to send an email after a foo is updated.
    #
    # def update
    #   super
    #   send_foo_updated_email(requested_resource)
    # end

    def destroy_bulk
      authorize_resource(resource_class)

      result_bulk = true
      delete_method = resource_class.respond_to?(:discard_all) ? :discard : :destroy
      scoped_resource.transaction do
        result_bulk = scoped_resource.find(params[:batch_action_ids]).collect(&delete_method)

        raise ActiveRecord::Rollback if result_bulk.detect(&:!)
      end

      if result_bulk
        flash[:notice] = translate_with_resource('destroy.success')
      else
        flash[:error] = translate_with_resource('destroy.failed')
      end

      redirect_to after_resource_destroyed_path(nil), status: :see_other
    end

    def show
      redirect_to [:edit, namespace, requested_resource], status: :moved_permanently
    end

    def clone
      new_resource = requested_resource.duplicate
      authorize_resource(new_resource)

      if new_resource.save
        redirect_to(after_resource_created_path(new_resource), notice: translate_with_resource('create.success'), status: :see_other)
      else
        render :new, locals: {
          page: Administrate::Page::Form.new(dashboard, new_resource)
        }, status: :unprocessable_entity
      end
    end

    # Override this method to specify custom lookup behavior.
    # This will be used to set the resource for the `show`, `edit`, and `update`
    # actions.
    #
    def find_resource(param)
      scoped_resource.friendly.find(param)
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

    def after_resource_created_path(requested_resource)
      [:edit, namespace, requested_resource]
    end

    def after_resource_updated_path(requested_resource)
      [:edit, namespace, requested_resource]
    end
  end
end
