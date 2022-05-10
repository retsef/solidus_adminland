module Admin
  class Spree::Variant::StockItemsController < Spree::Variant::BaseController
    before_action :grep_count_on_hand, only: %i[create update]

    def resource_class
      ::Spree::StockItem
    end

    def scoped_resource
      scoped_resource ||= resource_class.where(variant: requested_parent_resource)

      # Administrate ransack
      @ransack_results = authorized_scope(scoped_resource).ransack(params[:q])
      @ransack_results.result(distinct: true)
    end

    def new_resource
      resource_class.new
    end

    # Overwrite any of the RESTful controller actions to implement custom behavior
    # For example, you may want to send an email after a foo is updated.
    #
    def create
      super

      count_on_hand_adjustment = @adjustment.to_i - resource.count_on_hand
      adjust_stock_item_count_on_hand(resource, count_on_hand_adjustment)
    end

    def update
      super

      count_on_hand_adjustment = @adjustment.to_i - requested_resource.count_on_hand
      adjust_stock_item_count_on_hand(requested_resource, count_on_hand_adjustment)
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

    def grep_count_on_hand
      @adjustment = params[resource_class.model_name.param_key][:count_on_hand]
      params[resource_class.model_name.param_key].delete(:count_on_hand)
    end

    def adjust_stock_item_count_on_hand(resource, count_on_hand_adjustment)
      raise StockLocation::InvalidMovementError, t('spree.api.stock_not_below_zero') if (resource.count_on_hand + count_on_hand_adjustment).negative?

      @stock_movement = resource.stock_location.move(resource.variant, count_on_hand_adjustment, nil)
      @stock_item = @stock_movement.stock_item
    end
  end
end
