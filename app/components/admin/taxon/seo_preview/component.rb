class Admin::Taxon::SeoPreview::Component < ApplicationComponent
  attr_accessor :resource

  def initialize(resource:)
    super
    @resource = resource
  end

  def current_store
    @current_store ||= Spree::Store.default
  end

  def meta_title
    resource.send(:meta_title).presence || resource.send(:name).truncate(128)
  end

  def meta_url
    "https://#{current_store.url}/#{resource.send(:permalink)}"
  end

  def meta_description
    resource.send(:meta_description).presence || resource.send(:description).to_s.truncate(128)
  end
end
