module Spree::ReimbursementTypeOverride
  extend ActiveSupport::Concern

  class_methods do
    def real_model_name
      ActiveModel::Name.new(self, nil, self.to_s)
    end
    
    def model_name
      Spree::ReimbursementType.model_name
    end
  end
end

# Rails.application.config.spree.reimbursement_types.each do |reimbursement_type|
#   reimbursement_type.include Spree::ReimbursementTypeOverride
# end
