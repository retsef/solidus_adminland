module Spree::ActiveStorageAdapter::AttachmentOverride
  extend ActiveSupport::Concern

  included do
    def variant(transformations)
      case transformations
      when Symbol
        style = transformations
        size = style_to_size(style&.to_sym)
        return @attachment.variant(
          resize: size,
          strip: true,
          'auto-orient': true,
          colorspace: 'sRGB'
        ).processed
      end

      @attachment.variant(transformations)
    end
  end
end

Spree::ActiveStorageAdapter::Attachment.include Spree::ActiveStorageAdapter::AttachmentOverride
