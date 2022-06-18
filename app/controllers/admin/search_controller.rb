class Admin::SearchController < Admin::ApplicationController
  skip_verify_authorized

  SEARCH_DASHBOARDS = [
    'Spree::Product',
    'Spree::Order'
  ].freeze

  # https://blog.corsego.com/hotwire-turbo-streams-autocomplete-search
  def index
    search_term = params[:search].to_s.strip
    resources = filter_resources(scoped_resource, search_term: search_term)
  end

  private

  def filter_resources(resources, search_term:)
    Administrate::Search.new(
      resources,
      dashboard,
      search_term
    ).run
  end
end
