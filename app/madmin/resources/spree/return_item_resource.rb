class Spree::ReturnItemResource < Madmin::Resource
  # Attributes
  attribute :id, form: false
  attribute :created_at, form: false
  attribute :updated_at, form: false
  attribute :amount
  attribute :included_tax_total
  attribute :additional_tax_total
  attribute :reception_status
  attribute :acceptance_status
  attribute :acceptance_status_errors
  attribute :resellable

  # Associations
  attribute :return_authorization
  attribute :inventory_unit
  attribute :exchange_variant
  attribute :exchange_inventory_unit
  attribute :customer_return
  attribute :reimbursement
  attribute :preferred_reimbursement_type
  attribute :override_reimbursement_type
  attribute :return_reason

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
