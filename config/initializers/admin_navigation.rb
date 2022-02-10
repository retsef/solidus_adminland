Rails.application.configure do
  config.admin_navigation = ActiveSupport::OrderedOptions.new

  config.admin_navigation.main_entries = []

  order_menu_item = Admin::MenuItem.new(label: 'Orders', icon: 'fe fe-inbox')
  order_menu_item.append(Admin::MenuItem.new(label: 'All Order', url: :admin_orders_path))

  config.admin_navigation.main_entries << order_menu_item

  product_menu_item = Admin::MenuItem.new(label: 'Products', icon: 'fe fe-tag')
  product_menu_item.append(Admin::MenuItem.new(label: 'All Products', url: :admin_products_path))
  product_menu_item.append(Admin::MenuItem.new(label: 'Option Types', url: :admin_option_types_path))
  product_menu_item.append(Admin::MenuItem.new(label: 'Properties', url: :admin_properties_path))
  product_menu_item.append(Admin::MenuItem.new(label: 'Taxonomies', url: :admin_taxonomies_path))

  config.admin_navigation.main_entries << product_menu_item

  customer_menu_item = Admin::MenuItem.new(label: 'Customers', icon: 'fe fe-users')
  customer_menu_item.append(Admin::MenuItem.new(label: 'All Customers', url: :admin_users_path))

  config.admin_navigation.main_entries << customer_menu_item

  promotion_menu_item = Admin::MenuItem.new(label: 'Promotions', icon: 'fe fe-percent')
  promotion_menu_item.append(Admin::MenuItem.new(label: 'All Promotions', url: :admin_promotions_path))
  promotion_menu_item.append(Admin::MenuItem.new(label: 'Promotion Categories', url: :admin_promotion_categories_path))

  config.admin_navigation.main_entries << product_menu_item

  stock_menu_item = Admin::MenuItem.new(label: 'Stocks', icon: 'fe fe-package')
  stock_menu_item.append(Admin::MenuItem.new(label: 'All Stock items', url: :admin_stock_items_path))
  stock_menu_item.append(Admin::MenuItem.new(label: 'Stock locations', url: :admin_stock_locations_path))

  config.admin_navigation.main_entries << stock_menu_item


  # Settings
  config.admin_navigation.setting_entries = []

  config.admin_navigation.setting_entries << Admin::MenuItem.new(label: 'Stores', url: :admin_stores_path)

  shipping_menu_item = Admin::MenuItem.new(label: 'Shipping')
  shipping_menu_item.append(Admin::MenuItem.new(label: 'Shipping Methods', url: :admin_shipping_methods_path))
  shipping_menu_item.append(Admin::MenuItem.new(label: 'Shipping Categories', url: :admin_shipping_categories_path))

  config.admin_navigation.setting_entries << shipping_menu_item

  tax_menu_item = Admin::MenuItem.new(label: 'Taxes')
  tax_menu_item.append(Admin::MenuItem.new(label: 'Tax Categories', url: :admin_tax_categories_path))
  tax_menu_item.append(Admin::MenuItem.new(label: 'Tax Rates', url: :admin_tax_rates_path))

  config.admin_navigation.setting_entries << tax_menu_item
  
  config.admin_navigation.setting_entries << Admin::MenuItem.new(label: 'Zones', url: :admin_zones_path)

end
