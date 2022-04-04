class PurchasedOrderSameUserMonitor < ApplicationMonitor
  self.report_class = Spree::OrderReport

  def relation
    Spree::Order.complete
  end

  def groupers
    %i[completed_at]
  end

  def aggregators
    %i[user_id]
  end

  def dimensions
    {
      completed_at: { min: period.min, max: period.max }
    }
  end

  def summary
    report.data.sum(0) { |d| d[:values].first[:value] || 0 }
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
