module ActiveLinkToHelper
  # Wrapper around link_to. Accepts following params:
  #   :active         => Boolean | Symbol | Regex | Controller/Action Pair
  #   :class_active   => String
  #   :class_inactive => String
  #   :active_disable => Boolean
  #   :wrap_tag       => Symbol
  # Example usage:
  #   active_link_to('/users', class_active: 'enabled')
  #   active_link_to(users_path, active: :exclusive, wrap_tag: :li)
  def active_link_to(*args, &block)
    name = block_given? ? capture(&block) : args.shift
    options = args.shift || {}
    html_options = args.shift || {}

    url = url_for(options)

    active_options  = {}
    link_options    = {}
    attr_options    = %i[active class_active class_inactive active_disable wrap_tag wrap_class]
    html_options.each do |k, v|
      if attr_options.member?(k)
        active_options[k] = v
      else
        link_options[k] = v
      end
    end

    css_class = "#{link_options.delete(:class)} "

    wrap_tag    = active_options[:wrap_tag].presence
    wrap_class  = active_options[:wrap_class].present? ? "#{active_options[:wrap_class]} " : ''

    if wrap_tag.present?
      wrap_class << active_link_to_class(url, active_options)
      wrap_class.strip!
    else
      css_class << active_link_to_class(url, active_options)
      css_class.strip!
    end

    link_options[:class] = css_class if css_class.present?
    link_options['aria-current'] = 'page' if active_link?(url, active_options[:active])

    link = if active_options[:active_disable] == true && active_link?(url, active_options[:active])
             content_tag(:span, name, link_options)
           else
             link_to(name, url, link_options)
           end

    wrap_tag ? content_tag(wrap_tag, link, class: wrap_class.presence) : link
  end

  # Returns css class name. Takes the link's URL and its params
  # Example usage:
  #   active_link_to_class('/root', class_active: 'on', class_inactive: 'off')
  #
  def active_link_to_class(url, options = {})
    if active_link?(url, options[:active])
      options[:class_active] || 'active'
    else
      options[:class_inactive] || ''
    end
  end

  # Returns true or false based on the provided path and condition
  # Possible condition values are:
  #                  Boolean -> true | false
  #                   Symbol -> :exclusive | :inclusive
  #                    Regex -> /regex/
  #   Controller/Action Pair -> [[:controller], [:action_a, :action_b]]
  #
  # Example usage:
  #
  #   active_link?('/root', true)
  #   active_link?('/root', :exclusive)
  #   active_link?('/root', /^\/root/)
  #   active_link?('/root', ['users', ['show', 'edit']])
  #
  def active_link?(url, condition = nil)
    original_url = url
    url = Addressable::URI.parse(url).path
    path = request.original_fullpath
    case condition
    when :inclusive, nil
      path.match(%r{^#{Regexp.escape(url).chomp('/')}(/.*|\?.*)?$}).present?
    when :exclusive
      path.match(%r{^#{Regexp.escape(url)}/?(\?.*)?$}).present?
    when :exact
      path == original_url
    when Regexp
      path.match(condition).present?
    when Array
      controllers = [*condition[0]]
      actions     = [*condition[1]]

      controller_exist = controllers.blank? || controllers.member?(params[:controller])
      action_exist = actions.blank? || actions.member?(params[:action])

      return true if controller_exist && action_exist

      controllers.any? { |controller, action| params[:controller] == controller.to_s && params[:action] == action.to_s }
    when TrueClass
      true
    when FalseClass
      false
    when Hash
      condition.all? do |key, value|
        params[key].to_s == value.to_s
      end
    end
  end
end
