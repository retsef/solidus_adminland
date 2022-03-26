class ApplicationMonitor
  MONITOR_SUFFIX = 'Monitor'.freeze

  MONITOR_TYPES = %i[
    line
    area
    bar
    column
    pie
  ].freeze

  def labels
    []
  end

  def type
    nil
  end
end
