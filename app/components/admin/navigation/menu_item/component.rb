module Admin::Navigation
  class MenuItem::Component < BaseComponent
    attr_accessor :label, :icon, :options

    def initialize(item: nil, **options)
      super

      @label = item.label
      @icon = item.icon

      @options = options
    end
  end
end
