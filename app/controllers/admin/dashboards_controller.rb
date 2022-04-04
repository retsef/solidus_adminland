class Admin::DashboardsController < Admin::ApplicationController
  def index
    @monitors = Rails.application.config.admin_monitors.collect { |m| m.constantize.new }
  end
end
