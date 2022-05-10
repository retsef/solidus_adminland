module Admin
  class Spree::Product::BaseController < Spree::BaseController
    include BelongsTo

    authorize :product, through: :current_product

    def current_product
      @current_product ||= find_parent_resource(params[:product_id])
    end

    private

    def scoped_resource
      scoped_resource ||= resource_class.where(product: requested_parent_resource)

      # Administrate ransack
      @ransack_results = authorized_scope(scoped_resource).ransack(params[:q])
      @ransack_results.result(distinct: true)
    end

    def requested_parent_resource
      @requested_parent_resource ||= find_parent_resource(params[:product_id]).tap do |resource|
        authorize_resource(resource)
      end
    end

    def find_parent_resource(param)
      ::Spree::Product.friendly.find(param)
    end

    def parent_dashboard
      @parent_dashboard ||= ::Spree::ProductDashboard.new
    end

    def new_resource
      resource_class.new(product: requested_parent_resource)
    end

    def sanitized_order_params(page, current_field_name)
      collection_names = page.item_includes + [current_field_name]
      association_params = collection_names.map do |assoc_name|
        { assoc_name => %i[order direction page per_page] }
      end
      params.permit(:search, :id, :product_id, :_page, :per_page, association_params)
    end

    def resource_title
      resource_class.model_name.human
    end

    def after_resource_created_path(_requested_resource)
      [namespace, requested_parent_resource]
    end

    def after_resource_updated_path(_requested_resource)
      [namespace, requested_parent_resource]
    end

    def after_resource_destroy_path(_requested_resource)
      [namespace, requested_parent_resource, controller_name.to_sym]
    end
  end
end
