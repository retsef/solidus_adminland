module ActiveReporter::Serializer::BaseOverride
  extend ActiveSupport::Concern

  included do
    def human_time_value_label(dimension, value)
      case value.bin_edges
      when :min_and_max
        time_formats.detect { |step, format| return value.min.strftime(format) if value.max == value.min.advance(step => 1) } || "#{value.min} to #{value.max}"
      when :min
        "after #{value.min}"
      when :max
        "before #{value.max}"
      else
        human_null_value_label(dimension)
      end
    end
  end
end

ActiveReporter::Serializer::Base.include ActiveReporter::Serializer::BaseOverride
