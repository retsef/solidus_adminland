Rails.application.configure do
  config.admin_navigation = ActiveSupport::OrderedOptions.new

  config.admin_navigation.main_entries = []

  config.admin_navigation.main_entries << Admin::MenuItem.new(label: 'Orders', icon: 'fe fe-inbox').tap do |item|
    item.append(Admin::MenuItem.new(label: 'All Order', url: :admin_orders_path))
  end

  config.admin_navigation.main_entries << Admin::MenuItem.new(label: 'Products', icon: 'fe fe-tag').tap do |item|
    item.append(Admin::MenuItem.new(label: 'All Products', url: :admin_products_path))
    item.append(Admin::MenuItem.new(label: 'Option Types', url: :admin_option_types_path))
    item.append(Admin::MenuItem.new(label: 'Properties', url: :admin_properties_path))
    item.append(Admin::MenuItem.new(label: 'Taxonomies', url: :admin_taxonomies_path))
  end

  config.admin_navigation.main_entries << Admin::MenuItem.new(label: 'Customers', icon: 'fe fe-users').tap do |item|
    item.append(Admin::MenuItem.new(label: 'All Customers', url: :admin_users_path))
  end

  config.admin_navigation.main_entries << Admin::MenuItem.new(label: 'Promotions', icon: 'fe fe-percent').tap do |item|
    item.append(Admin::MenuItem.new(label: 'All Promotions', url: :admin_promotions_path))
    item.append(Admin::MenuItem.new(label: 'Promotion Categories', url: :admin_promotion_categories_path))
  end

  config.admin_navigation.main_entries << Admin::MenuItem.new(label: 'Stocks', icon: 'fe fe-package').tap do |item|
    item.append(Admin::MenuItem.new(label: 'All Stock items', url: :admin_stock_items_path))
    item.append(Admin::MenuItem.new(label: 'Stock locations', url: :admin_stock_locations_path))
  end


  # Settings
  config.admin_navigation.setting_entries = []

  config.admin_navigation.setting_entries << Admin::MenuItem.new(label: 'Stores', url: :admin_stores_path)

  config.admin_navigation.setting_entries << Admin::MenuItem.new(label: 'Shipping').tap do |item|
    item.append(Admin::MenuItem.new(label: 'Shipping Methods', url: :admin_shipping_methods_path))
    item.append(Admin::MenuItem.new(label: 'Shipping Categories', url: :admin_shipping_categories_path))
  end

  config.admin_navigation.setting_entries << Admin::MenuItem.new(label: 'Taxes').tap do |item|
    item.append(Admin::MenuItem.new(label: 'Tax Categories', url: :admin_tax_categories_path))
    item.append(Admin::MenuItem.new(label: 'Tax Rates', url: :admin_tax_rates_path))
  end
  
  config.admin_navigation.setting_entries << Admin::MenuItem.new(label: 'Zones', url: :admin_zones_path)

end
