module Admin::Variant
  extend ActiveSupport::Concern

  included do
    before_action :detect_device_format

    private

    def detect_device_format # rubocop:disable Metrics/CyclomaticComplexity
      case request.user_agent
      when /Turbo Native/i
        request.variant = :native
      when /POS/i
        request.variant = :pos
      when /iPhone/i || (/Android/i && /mobile/i) || /Windows Phone/i
        request.variant = :phone
      when /iPad/i || /Android/i
        request.variant = :tablet
      end
    end
  end
end
