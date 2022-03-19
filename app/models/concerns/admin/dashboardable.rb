module Admin::Dashboardable
  extend ActiveSupport::Concern

  included do
    def dashboard_class_name
      @dashboard_class_name ||= "#{self.class}Dashboard"
    end

    def dashboard_class
      @dashboard_class ||= dashboard_class_name.constantize
    end

    def dashboard_resource
      @dashboard_resource ||= dashboard_class.new
    end

    def dashboard_display_name
      dashboard_resource.display_resource(self)
    end
  end
end
