module Admin
  class Spree::Order::PaymentsController < Spree::Order::BaseController
    def resource_class
      ::Spree::Payment
    end

    # Overwrite any of the RESTful controller actions to implement custom behavior
    # For example, you may want to send an email after a foo is updated.
    #
    # def update
    #   super
    #   send_foo_updated_email(requested_resource)
    # end

    def create
      resource = ::Spree::PaymentCreate.new(requested_parent_resource, resource_params).build
      authorize_resource(resource)

      resource.source = resource.payment_method.payment_source_class.find_by(id: params[:card]) if resource.payment_method.source_required? && params[:card].present? && params[:card] != 'new'

      begin
        unless resource.save
          flash[:error] = t('spree.payment_could_not_be_created')

          render :new, locals: {
            page: Administrate::Page::Form.new(dashboard, resource)
          }, status: :unprocessable_entity
          return
        end

        if resource.completed?
          # If the order was already complete then go ahead and process the payment
          # (auth and/or capture depending on payment method configuration)
          resource.process! if resource.checkout?
        else
          # Transition order as far as it will go.
          while requested_parent_resource.next; end
        end

        redirect_to(after_resource_created_path(resource), notice: translate_with_resource('create.success'), status: :see_other)
      rescue Spree::Core::GatewayError => e
        flash[:error] = e.message.to_s

        render :new, locals: {
          page: Administrate::Page::Form.new(dashboard, resource)
        }, status: :unprocessable_entity
      end
    end

    %i[void capture].each do |event|
      define_method(event) do
        return unless requested_resource.payment_source

        # Because we have a transition method also called void, we do this to avoid conflicts.
        event = 'void_transaction' if event == :void
        if requested_resource.send("#{event}!")
          flash[:success] = t('spree.payment_updated')
        else
          flash[:error] = t('spree.cannot_perform_operation')
        end

        redirect_to(after_resource_updated_path(requested_resource), status: :see_other)
      rescue Spree::Core::GatewayError => e
        flash[:error] = e.message.to_set

        redirect_to(after_resource_updated_path(requested_resource), status: :see_other)
      end

      #  render :edit, locals: {
      #    page: Administrate::Page::Form.new(dashboard, requested_resource),
      #  }, status: :unprocessable_entity
    end

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

    private

    def new_resource
      resource_class.new(order: requested_parent_resource, amount: requested_parent_resource.outstanding_balance)
    end
  end
end
