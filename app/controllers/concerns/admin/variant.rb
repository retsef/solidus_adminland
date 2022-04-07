module Admin::Variant
  extend ActiveSupport::Concern

  included do
    before_action :detect_device_format

    private

      def detect_device_format
        case request.user_agent
        when /Turbo Native/i
          request.variant = :native
        when /iPad/i
          request.variant = :tablet
        when /iPhone/i
          request.variant = :phone
        when /Android/i && /mobile/i
          request.variant = :phone
        when /Android/i
          request.variant = :tablet
        when /Windows Phone/i
          request.variant = :phone
        end
      end
  end
end
