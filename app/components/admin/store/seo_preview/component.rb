class Admin::Store::SeoPreview::Component < ApplicationComponent
  attr_accessor :resource

  def initialize(resource:)
    super
    @resource = resource
  end

  def meta_title
    resource.send(:seo_title).presence || resource.send(:name).truncate(128)
  end

  def meta_url
    "https://#{resource.url}"
  end

  def meta_description
    resource.send(:meta_description).presence
  end
end
