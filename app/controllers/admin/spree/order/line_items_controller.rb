module Admin
  class Spree::Order::LineItemsController < Spree::Order::BaseController
    def resource_class
      ::Spree::LineItem
    end

    # Overwrite any of the RESTful controller actions to implement custom behavior
    # For example, you may want to send an email after a foo is updated.

    def create
      dry_resource = resource_class.new(resource_params)
      authorize_resource(dry_resource)

      resource = requested_parent_resource.contents.add(
        dry_resource.variant,
        dry_resource.quantity || 1,
        options: resource_params[:options].to_h
      )

      if resource.valid?
        redirect_to(
          after_resource_created_path(resource),
          notice: translate_with_resource('create.success')
        )
      else
        render :new, locals: {
          page: Administrate::Page::Form.new(dashboard, resource)
        }, status: :unprocessable_entity
      end
    end

    def update
      requested_resource.assign_attributes(resource_params)
      authorize_resource(requested_resource)

      line_items_attributes = {
        id: requested_resource.id,
        variant_id: requested_resource.variant_id,
        quantity: requested_resource.quantity || 1,
        options: resource_params[:options].to_h
      }

      # if requested_resource.update(resource_params)
      if requested_parent_resource.contents.update_cart(line_items_attributes: line_items_attributes)
        redirect_to(
          after_resource_updated_path(requested_resource),
          notice: translate_with_resource('update.success')
        )
      else
        render :edit, locals: {
          page: Administrate::Page::Form.new(dashboard, requested_resource)
        }, status: :unprocessable_entity
      end
    end

    def destroy
      requested_parent_resource.contents.remove_line_item(requested_resource)

      # if requested_resource.destroy
      #   flash[:notice] = translate_with_resource('destroy.success')
      # else
      #   flash[:error] = requested_resource.errors.full_messages.join('<br/>')
      # end
      redirect_to after_resource_destroyed_path(requested_resource)
    end

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
  end
end
