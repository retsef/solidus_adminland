module Admin
  class Spree::Order::BaseController < Admin::ApplicationController
    include BelongsTo

    private

    def scoped_resource
      scoped_resource ||= resource_class.where(order: parent_page.resource)

      # Administrate ransack
      @ransack_results = scoped_resource.ransack(params[:q])
      @ransack_results.result(distinct: true)
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

    def sanitized_order_params(page, current_field_name)
      collection_names = page.item_includes + [current_field_name]
      association_params = collection_names.map do |assoc_name|
        { assoc_name => %i[order direction page per_page] }
      end
      params.permit(:search, :id, :order_id, :_page, :per_page, association_params)
    end

    def resource_title
      resource_class.model_name.human
    end

    def after_resource_created_path(_requested_resource)
      [namespace, parent_page.resource]
    end

    def after_resource_updated_path(_requested_resource)
      [namespace, parent_page.resource]
    end

    def after_resource_destroy_path(_requested_resource)
      [namespace, parent_page.resource, controller_name.to_sym]
    end
  end
end
