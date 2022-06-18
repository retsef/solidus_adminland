module Spree::ActiveStorageAdapter::AttachmentOverride
  extend ActiveSupport::Concern

  included do
    def variant(transformations)
      case transformations
      when Symbol
        # Solidus Image behavior
        style = transformations
        return variant_style(style)
      end

      # Active Storage default :variant behavior
      @attachment.variant(transformations)
    end

    private

    def variant_style(style)
      size = style_to_size(style)

      @attachment.variant(
        resize_to_limit: size,
        strip: true
      ).processed
    end
  end
end

Spree::ActiveStorageAdapter::Attachment.include Spree::ActiveStorageAdapter::AttachmentOverride
