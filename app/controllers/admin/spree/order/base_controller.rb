module Admin
  class Spree::Order::BaseController < Admin::ApplicationController
    helper_method :parent_page

    private

    def scoped_resource
      scoped_resource ||= resource_class.where(order: parent_page.resource)

      # Administrate ransack
      @ransack_results = scoped_resource.ransack(params[:q])
      @ransack_results.result(distinct: true)
    end

    def parent_page
      @parent_page ||= Administrate::Page::Show.new(parent_dashboard, requested_parent_resource)
    end

    def requested_parent_resource
      @requested_parent_resource ||= ::Spree::Order.find_by!(number: params[:order_id]).tap do |resource|
        authorize_resource(resource)
      end
    end

    def parent_dashboard
      @parent_dashboard ||= ::Spree::OrderDashboard.new
    end

    def new_resource
      resource_class.new(order: parent_page.resource)
    end

    def valid_action?(name, resource = dashboard_class)
      resource_path = resource.to_s.underscore.remove('_dashboard').pluralize

      !!routes.detect do |controller, action|
        controller == resource_path && action == name.to_s
      end
    end

    def sanitized_order_params(page, current_field_name)
      collection_names = page.item_includes + [current_field_name]
      association_params = collection_names.map do |assoc_name|
        { assoc_name => %i[order direction page per_page] }
      end
      params.permit(:search, :id, :order_id, :_page, :per_page, association_params)
    end

    # def after_resource_destroyed_path(_requested_resource)
    #   { action: :index }
    # end

    def after_resource_created_path(requested_resource)
      [namespace, requested_parent_resource, resource_class]
    end

    def after_resource_updated_path(requested_resource)
      [namespace, requested_parent_resource, resource_class]
    end
  end
end