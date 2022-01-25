class Spree::OrderResource < Madmin::Resource
  # Attributes
  attribute :id, form: false
  attribute :number
  attribute :item_total
  attribute :total
  attribute :state
  attribute :adjustment_total
  attribute :completed_at
  attribute :payment_total
  attribute :shipment_state
  attribute :payment_state
  attribute :email
  attribute :special_instructions
  attribute :created_at, form: false
  attribute :updated_at, form: false
  attribute :currency
  attribute :last_ip_address
  attribute :shipment_total
  attribute :additional_tax_total
  attribute :promo_total
  attribute :channel
  attribute :included_tax_total
  attribute :item_count, form: false
  attribute :approved_at
  attribute :confirmation_delivered
  attribute :guest_token
  attribute :canceled_at
  attribute :approver_name
  attribute :frontend_viewable

  # Associations
  attribute :user
  attribute :bill_address
  attribute :ship_address
  attribute :store
  attribute :line_items
  attribute :variants
  attribute :products
  attribute :shipments
  attribute :inventory_units
  attribute :cartons
  attribute :adjustments
  attribute :line_item_adjustments
  attribute :shipment_adjustments
  attribute :all_adjustments
  attribute :order_promotions
  attribute :promotions
  attribute :payments
  attribute :valid_store_credit_payments
  attribute :return_authorizations
  attribute :return_items
  attribute :customer_returns
  attribute :reimbursements
  attribute :refunds
  attribute :state_changes
  attribute :created_by
  attribute :approver
  attribute :canceler

  # Uncomment this to customize the display name of records in the admin area.
  # def self.display_name(record)
  #   record.name
  # end

  # Uncomment this to customize the default sort column and direction.
  # def self.default_sort_column
  #   "created_at"
  # end
  #
  # def self.default_sort_direction
  #   "desc"
  # end
end
