Rails.application.configure do
  # config.admin_monitors = ActiveSupport::OrderedOptions.new
  config.admin_monitors = []

  config.admin_monitors << 'PurchasedOrderMonitor'
  config.admin_monitors << 'PurchasedOrderSameUserMonitor'
  config.admin_monitors << 'PurchasedOrderAverageMonitor'
end
