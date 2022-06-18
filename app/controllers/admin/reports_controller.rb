class Admin::ReportsController < Admin::ApplicationController
  skip_verify_authorized

  def index
    @reports = []
  end

  def show
    report_class = params[:id].camelcase.constantize
    @report = report_class.new
  end
end
