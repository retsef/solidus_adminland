class Spree::Order::BillAddressDashboard < Spree::Order::AddressDashboard
  def self.model
    ::Spree::Address
  end

  def resource_class
    self.class.model
  end

  def resource_class_name
    resource_class.name.to_s
  end

  # Overwrite this method to customize how addresses are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(address)
  #   "Spree::Address ##{address.id}"
  # end
end
