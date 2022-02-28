class Spree::Promotion::Actions::BaseDashboard < Spree::BaseDashboard
  def self.model
    # to_s.chomp(DASHBOARD_SUFFIX).sub('::Promotion::Actions::', '::').classify.constantize
    to_s.chomp(DASHBOARD_SUFFIX).classify.constantize
  end

  def resource_class
    self.class.model
  end

  def resource_class_name
    resource_class.name.to_s
  end
end
