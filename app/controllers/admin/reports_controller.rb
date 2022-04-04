class Admin::ReportsController < Admin::ApplicationController
  def index
    @reports = []
  end

  def show
    report_class = params[:id].camelcase.constantize
    @report = report_class.new
  end
end
