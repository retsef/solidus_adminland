class Spree::Promotion::ActionDashboard < Spree::PromotionActionDashboard
  def self.model
    dashboard_class = to_s.chomp(DASHBOARD_SUFFIX)
    dashboard_class = 'Spree::PromotionAction' if dashboard_class == 'Spree::Promotion::Action'

    dashboard_class.sub('::Promotion::', '::').classify.constantize
  end

  def resource_class
    self.class.model
  end

  def resource_class_name
    resource_class.name.to_s
  end
end
