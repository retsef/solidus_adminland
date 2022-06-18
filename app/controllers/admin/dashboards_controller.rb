class Admin::DashboardsController < Admin::ApplicationController
  skip_verify_authorized

  before_action :fetch_period

  def index
    @monitors = all_monitors.collect { |m| m.constantize.new(since_at: @since_at, until_at: @until_at) }
  end

  def show
    @monitor = all_monitors.collect { |m| m.constantize.new(since_at: @since_at, until_at: @until_at) }.detect { |m| m.id == params[:id] }
  end

  private

  def fetch_period
    @since_at ||= params[:since_at] if params.key? :since_at
    @since_at ||= params[:admin_period_form][:since_at] if params.key? :admin_period_form
    @since_at ||= (Time.zone.today.beginning_of_day - 30.days)
    @since_at = Date.parse(@since_at) if @since_at.is_a? String

    @until_at ||= params[:until_at] if params.key? :until_at
    @until_at ||= params[:admin_period_form][:until_at] if params.key? :admin_period_form
    @until_at ||= Time.zone.today.end_of_day
    @until_at = Date.parse(@until_at) if @until_at.is_a? String
  end

  def all_monitors
    Rails.application.config.admin_monitors
  end
end
