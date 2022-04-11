class Spree::Promotion::RuleDashboard < Spree::PromotionRuleDashboard
  def self.model
    dashboard_class = to_s.chomp(DASHBOARD_SUFFIX)
    dashboard_class = 'Spree::PromotionRule' if dashboard_class == 'Spree::Promotion::Rule'

    dashboard_class.sub('::Promotion::', '::').classify.constantize
  end

  def resource_class
    self.class.model
  end

  def resource_class_name
    resource_class.name.to_s
  end
end
