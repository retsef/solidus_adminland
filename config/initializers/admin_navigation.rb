Rails.application.configure do
  config.admin_navigation = ActiveSupport::OrderedOptions.new

  # Main
  config.admin_navigation.main_entries = []

  config.admin_navigation.main_entries << Admin::MenuItem.new(label: 'admin.navigation.main.orders.title', icon: 'ti ti-inbox').tap do |item|
    item.append(Admin::MenuItem.new(label: 'admin.navigation.main.orders.all_orders', url: :admin_orders_path))
  end

  config.admin_navigation.main_entries << Admin::MenuItem.new(label: 'admin.navigation.main.products.title', icon: 'ti ti-tag').tap do |item|
    item.append(Admin::MenuItem.new(label: 'admin.navigation.main.products.all_products', url: :admin_products_path))
    item.append(Admin::MenuItem.new(label: 'admin.navigation.main.products.option_types', url: :admin_option_types_path))
    item.append(Admin::MenuItem.new(label: 'admin.navigation.main.products.properties', url: :admin_properties_path))
    item.append(Admin::MenuItem.new(label: 'admin.navigation.main.products.taxonomies', url: :admin_taxonomies_path))
  end

  config.admin_navigation.main_entries << Admin::MenuItem.new(label: 'admin.navigation.main.customers.title', icon: 'ti ti-users').tap do |item|
    item.append(Admin::MenuItem.new(label: 'admin.navigation.main.customers.all_customers', url: :admin_users_path))
  end

  config.admin_navigation.main_entries << Admin::MenuItem.new(label: 'admin.navigation.main.promotions.title', icon: 'ti ti-discount-2').tap do |item|
    item.append(Admin::MenuItem.new(label: 'admin.navigation.main.promotions.all_promotions', url: :admin_promotions_path))
    item.append(Admin::MenuItem.new(label: 'admin.navigation.main.promotions.promotion_categories', url: :admin_promotion_categories_path))
  end

  config.admin_navigation.main_entries << Admin::MenuItem.new(label: 'admin.navigation.main.stocks.title', icon: 'ti ti-package').tap do |item|
    item.append(Admin::MenuItem.new(label: 'admin.navigation.main.stocks.all_stock_items', url: :admin_stock_items_path))
    item.append(Admin::MenuItem.new(label: 'admin.navigation.main.stocks.stock_locations', url: :admin_stock_locations_path))
  end


  # Settings
  config.admin_navigation.setting_entries = []

  config.admin_navigation.setting_entries << Admin::MenuItem.new(label: 'admin.navigation.settings.stores', icon: 'ti ti-building-store', url: :admin_stores_path)

  config.admin_navigation.setting_entries << Admin::MenuItem.new(label: 'admin.navigation.settings.shippings.title', icon: 'ti ti-truck-delivery').tap do |item|
    item.append(Admin::MenuItem.new(label: 'admin.navigation.settings.shippings.shipping_methods', url: :admin_shipping_methods_path))
    item.append(Admin::MenuItem.new(label: 'admin.navigation.settings.shippings.shipping_categories', url: :admin_shipping_categories_path))
  end

  config.admin_navigation.setting_entries << Admin::MenuItem.new(label: 'admin.navigation.settings.taxes.title', icon: 'ti ti-receipt-tax').tap do |item|
    item.append(Admin::MenuItem.new(label: 'admin.navigation.settings.taxes.tax_categories', url: :admin_tax_categories_path))
    item.append(Admin::MenuItem.new(label: 'admin.navigation.settings.taxes.tax_rates', url: :admin_tax_rates_path))
  end
  
  config.admin_navigation.setting_entries << Admin::MenuItem.new(label: 'admin.navigation.settings.zones', icon: 'ti ti-globe', url: :admin_zones_path)

end
