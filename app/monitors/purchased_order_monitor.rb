class PurchasedOrderMonitor < ApplicationMonitor
  def report
    @report ||= Spree::OrderReport.new(
      relation: Spree::Order.complete,
      groupers: [:completed_at],
      aggregators: [:total],
      dimensions: {
        completed_at: { min: since_at, max: until_at }
      }
    )
  end

  def summary
    Spree::Money.new(report.data.sum(0.0) { |d| d[:values].first[:value] })
  end

  def summary_diff
    0
  end

  def show_chart?
    true
  end

  def show_summary?
    true
  end

  def show_table?
    false
  end
end
