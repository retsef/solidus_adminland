require_relative 'serializers/apexcharts'

class ApplicationMonitor
  include ActiveModel::Model

  MONITOR_SUFFIX = 'Monitor'.freeze

  cattr_accessor :report_class

  attr_accessor :since_at, :until_at

  def initialize(since_at: nil, until_at: nil)
    super
    @since_at = since_at || Time.zone.now.beginning_of_day
    @until_at = until_at || Time.zone.now.end_of_day
  end

  def id
    self.class.name.demodulize.underscore
  end

  def title
    self.class.name.demodulize.underscore.humanize
  end

  def groupers
    []
  end

  def aggregators
    []
  end

  def dimensions
    {}
  end

  def relation
    nil
  end

  def report
    @report ||= report_class.new(
      relation: relation,
      groupers: groupers,
      aggregators: aggregators,
      dimensions: dimensions
    )
  end

  def period
    (since_at..until_at)
  end

  def previous_period
    diff = (until_at - since_at) / (60 * 60 * 24)

    (since_at - diff.days)..(since_at - 1.second)
  end

  def show_summary?
    false
  end

  def summary
    raise NotImplementedError
  end

  def summary_diff
    0
  end

  def show_chart?
    false
  end

  def chart
    @chart ||= Serializers::Apexcharts.new(report)
  end

  def show_table?
    false
  end

  def table
    @table ||= ActiveReporter::Serializer::Table.new(report)
  end
end
