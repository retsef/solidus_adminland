module Spree
  def self.table_name_prefix
    'spree_'
  end
  
  def self.use_relative_model_naming?
    true
  end
end
