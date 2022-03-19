class ApplicationRecord < ActiveRecord::Base
  include Admin::Dashboardable

  self.abstract_class = true
end
