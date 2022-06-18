class Admin::HomeController < Admin::ApplicationController
  skip_verify_authorized

  def index; end
end
