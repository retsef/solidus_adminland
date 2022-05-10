module Admin
  class Spree::Variant::BaseController < Spree::BaseController
    include BelongsTo

    authorize :variant, through: :current_variant

    def current_variant
      @current_variant ||= find_parent_resource(params[:variant_id])
    end

    private

    def scoped_resource
      scoped_resource ||= resource_class.where(variant: requested_parent_resource)

      # Administrate ransack
      @ransack_results = authorized_scope(scoped_resource).ransack(params[:q])
      @ransack_results.result(distinct: true)
    end

    def requested_parent_resource
      @requested_parent_resource ||= find_parent_resource(params[:variant_id]).tap do |resource|
        authorize_resource(resource)
      end
    end

    def find_parent_resource(param)
      ::Spree::Variant.find(param)
    end

    def parent_dashboard
      @parent_dashboard ||= ::Spree::VariantDashboard.new
    end

    def new_resource
      resource_class.new(variant: requested_parent_resource)
    end

    def sanitized_order_params(page, current_field_name)
      collection_names = page.item_includes + [current_field_name]
      association_params = collection_names.map do |assoc_name|
        { assoc_name => %i[order direction page per_page] }
      end
      params.permit(:search, :id, :variant_id, :_page, :per_page, association_params)
    end

    def resource_title
      resource_class.model_name.human
    end
  end
end
