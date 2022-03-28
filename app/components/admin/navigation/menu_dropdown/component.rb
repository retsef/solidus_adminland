module Admin::Navigation
  class MenuDropdown::Component < BaseComponent
    attr_reader :label, :icon, :active, :options

    renders_many :items

    def initialize(label: '', icon: nil, active: false, **options)
      super

      @label = label
      @icon = icon
      @active = active

      @options = options
    end

    def link_active?
      active
    end
  end
end
