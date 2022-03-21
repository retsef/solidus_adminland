class ApplicationRecord < ActiveRecord::Base
  include Admin::Dashboardable
  include OrderQuery

  self.abstract_class = true
end
