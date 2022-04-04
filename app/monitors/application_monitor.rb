require_relative 'serializers/apexcharts'

class ApplicationMonitor
  include ActiveModel::Model

  MONITOR_SUFFIX = 'Monitor'.freeze

  attr_accessor :since_at, :until_at # , :groupers, :aggregators, :dimensions, :relation

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

  def report
    raise NotImplementedError
  end

  def period
    (since_at..until_at)
  end

  def previous_period
    # period.diff
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
