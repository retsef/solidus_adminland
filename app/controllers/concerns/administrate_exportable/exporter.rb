module AdministrateExportable
  module Exporter
    extend ActiveSupport::Concern

    included do
      def export
        authorize_resource(resource_class)
        search_term = params[:search].to_s.strip
        resources = filter_resources(scoped_resource, search_term: search_term)
        resources = apply_collection_includes(resources)
        resources = order.apply(resources)

        csv_data = AdministrateExportable::ExporterService.csv(dashboard, resource_class, resources)

        respond_to do |format|
          format.csv { send_data csv_data, filename: "#{resource_name.to_s.pluralize}-#{Time.zone.today}.csv" }
        end
      end
    end
  end
end
