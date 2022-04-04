class Serializers::Apexcharts < ActiveReporter::Serializer::Highcharts
  def series
    case report.groupers.count
    when 3
      dim1, dim2, dim3 = report.groupers
      report.data.flat_map.with_index do |d3, _i|
        d3[:values].map do |d2|
          {
            # stack: human_dimension_value_label(dim3, d3[:key]),
            name: human_dimension_value_label(dim2, d2[:key]),
            # (i.zero? ? :id : :linkedTo) => human_dimension_value_label(dim2, d2[:key]),
            # color: color_for(dim2, d2[:key]),
            data: d2[:values].map do |d1|
                    {
                      y: d1[:value].to_f,
                      # tooltip: tooltip_for(dim1 => d1, dim2 => d2, dim3 => d3),
                      # filters: filters_for(dim1 => d1, dim2 => d2, dim3 => d3)
                    }
                  end
          }
        end
      end
    when 2
      dim1, dim2 = report.groupers
      report.data.map do |d2|
        {
          name: human_dimension_value_label(dim2, d2[:key]),
          # color: color_for(dim2, d2[:key]),
          data: d2[:values].map do |d1|
                  {
                    y: d1[:value].to_f,
                    # tooltip: tooltip_for(dim1 => d1, dim2 => d2),
                    # filters: filters_for(dim1 => d1, dim2 => d2)
                  }
                end
        }
      end
    when 1
      dim1 = report.groupers.first
      [{
        name: human_aggregator_label(report.all_aggregators),
        data: report.data.map do |d1|
                {
                  x: human_dimension_value_label(dim1, d1[:key]),
                  y: d1[:values].first[:value].to_f,
                  # tooltip: tooltip_for(dim1 => d1),
                  # filters: filters_for(dim1 => d1)
                }
              end
      }]
    else
      raise ActiveReporter::InvalidParamsError, 'report must have <= 3 groupers'
    end
  end

  def apexcharts_options
    {
      chart: {
        type: 'line',
        stacked: report.groupers.length >= 2
      },
      colors: colors,
      series: series,
      xaxis: {
        # categories: categories,
        type: 'datetime',
      },
      labels: categories,
      legend: {
        show: report.groupers.length >= 2
      },
    }
  end

  def human_time_value_label(_dimension, value)
    case value.bin_edges
    when :min_and_max
      value.min.strftime('%F')
    when :min
      value.min.strftime('%F')
    when :max
      value.max.strftime('%F')
    else
      value.max.strftime('%F')
    end
  end
end
