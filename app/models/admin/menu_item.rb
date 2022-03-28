class Admin::MenuItem
  include ActiveModel::Model
  include ActiveLinkToHelper

  attr_accessor :icon, :position, :children

  def initialize(label: '', icon: nil, url: nil, position: 0, children: [])
    @label = label
    @icon = icon
    @url = url
    @position = position
    @children = children
  end

  def ordered_children
    children.sort_by(&:position)
  end

  def children?
    children.present?
  end

  def append(child)
    child.position = children.size
    @children << child
  end

  def label
    return I18n.t(@label) if I18n.exists?(@label)

    @label
  end

  def urls
    urls = []
    urls << url if url.present? && url != '#'
    urls += children.map(&:urls).flatten
    urls.compact
  end

  def url
    return '#' if @url.blank?
    return url_helpers.send(@url) if url_helpers.respond_to?(@url)

    @url
  end

  private

  def url_helpers
    Rails.application.routes.url_helpers
  end
end
