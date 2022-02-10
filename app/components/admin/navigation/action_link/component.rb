module Admin::Navigation
  class ActionLink::Component < BaseComponent
    attr_accessor :label, :url, :icon, :class_names, :options

    # rubocop:disable Metrics/ParameterLists
    def initialize(label: '', title: '', url: '#', icon: nil,
                   class_names: 'dropdown-item', **options)
      super

      @label = label.presence || title.presence
      @url = url
      @icon = icon

      @class_names = class_names
      @options = options
    end
    # rubocop:enable Metrics/ParameterLists
  end
end
