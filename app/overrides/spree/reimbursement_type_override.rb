module Spree::ReimbursementTypeOverride
  extend ActiveSupport::Concern

  class_methods do
    def model_name
      model_name ||= super

      parent_model_name = Spree::ReimbursementType.model_name

      model_name.instance_variable_set(:@route_key, parent_model_name.route_key)
      model_name.instance_variable_set(:@singular_route_key, parent_model_name.singular_route_key)

      model_name
    end
  end
end

# Rails.application.config.spree.reimbursement_types.each do |reimbursement_type|
[Spree::ReimbursementType::OriginalPayment, Spree::ReimbursementType::StoreCredit, Spree::ReimbursementType::Exchange, Spree::ReimbursementType::Credit].each do |reimbursement_type|
  reimbursement_type.include Spree::ReimbursementTypeOverride
end
