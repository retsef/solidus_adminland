Rails.application.configure do
  config.admin_navigation = ActiveSupport::OrderedOptions.new

  # Main
  config.admin_navigation.main_entries = []

  config.admin_navigation.main_entries << Admin::MenuItem.new(label: 'admin.navigation.main.home', icon: 'ti ti-home', url: :admin_root_path)

  config.admin_navigation.main_entries << Admin::MenuItem.new(label: 'admin.navigation.main.orders.title', icon: 'ti ti-inbox', resource_class: Spree::Order).tap do |item|
    item.append(Admin::MenuItem.new(label: 'admin.navigation.main.orders.all_orders', url: :admin_orders_path))
  end

  config.admin_navigation.main_entries << Admin::MenuItem.new(label: 'admin.navigation.main.products.title', icon: 'ti ti-tag').tap do |item|
    item.append(Admin::MenuItem.new(label: 'admin.navigation.main.products.all_products', url: :admin_products_path, resource_class: Spree::Product))
    item.append(Admin::MenuItem.new(label: 'admin.navigation.main.products.option_types', url: :admin_option_types_path, resource_class: Spree::OptionType))
    item.append(Admin::MenuItem.new(label: 'admin.navigation.main.products.properties', url: :admin_properties_path, resource_class: Spree::Property))
    item.append(Admin::MenuItem.new(label: 'admin.navigation.main.products.taxonomies', url: :admin_taxonomies_path, resource_class: Spree::Taxonomy))
  end

  config.admin_navigation.main_entries << Admin::MenuItem.new(label: 'admin.navigation.main.customers.title', icon: 'ti ti-users').tap do |item|
    item.append(Admin::MenuItem.new(label: 'admin.navigation.main.customers.all_customers', url: :admin_users_path))
  end

  config.admin_navigation.main_entries << Admin::MenuItem.new(label: 'admin.navigation.main.dashboards.title', icon: 'ti ti-chart-bar').tap do |item|
    item.append(Admin::MenuItem.new(label: 'admin.navigation.main.dashboards.all_dashboards', url: :admin_dashboards_path))
    item.append(Admin::MenuItem.new(label: 'admin.navigation.main.dashboards.all_reports', url: :admin_reports_path))
  end

  config.admin_navigation.main_entries << Admin::MenuItem.new(label: 'admin.navigation.main.promotions.title', icon: 'ti ti-discount-2').tap do |item|
    item.append(Admin::MenuItem.new(label: 'admin.navigation.main.promotions.all_promotions', url: :admin_promotions_path, resource_class: Spree::Promotion))
    item.append(Admin::MenuItem.new(label: 'admin.navigation.main.promotions.promotion_categories', url: :admin_promotion_categories_path, resource_class: Spree::PromotionCategory))
  end

  config.admin_navigation.main_entries << Admin::MenuItem.new(label: 'admin.navigation.main.stocks.title', icon: 'ti ti-package').tap do |item|
    item.append(Admin::MenuItem.new(label: 'admin.navigation.main.stocks.all_stock_items', url: :admin_stock_items_path, resource_class: Spree::StockItem))
    item.append(Admin::MenuItem.new(label: 'admin.navigation.main.stocks.stock_locations', url: :admin_stock_locations_path, resource_class: Spree::StockLocation))
  end


  # Settings
  config.admin_navigation.setting_entries = []

  config.admin_navigation.setting_entries << Admin::MenuItem.new(label: 'admin.navigation.settings.stores', icon: 'ti ti-building-store', url: :admin_stores_path, resource_class: Spree::Store)

  config.admin_navigation.setting_entries << Admin::MenuItem.new(label: 'admin.navigation.settings.payment_methods', icon: 'ti ti-wallet', url: :admin_payment_methods_path, resource_class: Spree::PaymentMethod)

  config.admin_navigation.setting_entries << Admin::MenuItem.new(label: 'admin.navigation.settings.taxes.title', icon: 'ti ti-receipt-tax').tap do |item|
    item.append(Admin::MenuItem.new(label: 'admin.navigation.settings.taxes.tax_categories', url: :admin_tax_categories_path, resource_class: Spree::TaxCategory))
    item.append(Admin::MenuItem.new(label: 'admin.navigation.settings.taxes.tax_rates', url: :admin_tax_rates_path, resource_class: Spree::TaxRate))
  end

  config.admin_navigation.setting_entries << Admin::MenuItem.new(label: 'admin.navigation.settings.reimbursements.title', icon: 'ti ti-receipt-refund').tap do |item|
    item.append(Admin::MenuItem.new(label: 'admin.navigation.settings.reimbursements.refund_reasons', url: :admin_refund_reasons_path, resource_class: Spree::RefundReason))
    item.append(Admin::MenuItem.new(label: 'admin.navigation.settings.reimbursements.reimbursement_types', url: :admin_reimbursement_types_path, resource_class: Spree::ReimbursementType))
    item.append(Admin::MenuItem.new(label: 'admin.navigation.settings.reimbursements.return_reasons', url: :admin_return_reasons_path, resource_class: Spree::ReturnReason))
    item.append(Admin::MenuItem.new(label: 'admin.navigation.settings.reimbursements.adjustment_reasons', url: :admin_adjustment_reasons_path, resource_class: Spree::AdjustmentReason))
    item.append(Admin::MenuItem.new(label: 'admin.navigation.settings.reimbursements.store_credit_reasons', url: :admin_store_credit_reasons_path, resource_class: Spree::StoreCreditReason))
  end

  config.admin_navigation.setting_entries << Admin::MenuItem.new(label: 'admin.navigation.settings.shippings.title', icon: 'ti ti-truck-delivery').tap do |item|
    item.append(Admin::MenuItem.new(label: 'admin.navigation.settings.shippings.shipping_methods', url: :admin_shipping_methods_path, resource_class: Spree::ShippingMethod))
    item.append(Admin::MenuItem.new(label: 'admin.navigation.settings.shippings.shipping_categories', url: :admin_shipping_categories_path, resource_class: Spree::ShippingCategory))
  end
  
  config.admin_navigation.setting_entries << Admin::MenuItem.new(label: 'admin.navigation.settings.zones', icon: 'ti ti-globe', url: :admin_zones_path, resource_class: Spree::Zone)

end
