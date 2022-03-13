# frozen_string_literal: true

module ViewComponent
  module Form
    class HintComponent < FieldComponent
      class_attribute :tag, instance_reader: false, instance_writer: false, instance_accessor: false,
                            instance_predicate: false
      attr_reader :attribute_content

      self.tag = :div

      def initialize(form, object_name, method_name, content_or_options = nil, options = nil)
        options ||= {}

        content_is_options = content_or_options.is_a?(Hash)
        if content_is_options
          options.merge! content_or_options
          @attribute_content = nil
        else
          @attribute_content = content_or_options
        end

        super(form, object_name, method_name, options)
      end

      def call
        content_or_options = content.presence || attribute_content.presence || content_from_translation.presence

        tag.public_send(self.class.tag, content_or_options, **options)
      end

      def render?
        content.present? || attribute_content.present? || content_from_translation.present?
      end

      def content_from_translation
        form.translate_from_namespace(method_name, namespace: :hints).presence
      end
    end
  end
end
