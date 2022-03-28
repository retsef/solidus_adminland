# frozen_string_literal: true

module ViewComponent
  module Form
    class HelpComponent < FieldComponent
      class_attribute :tag, instance_reader: false, instance_writer: false, instance_accessor: false,
                            instance_predicate: false
      attr_accessor :attribute_content

      self.tag = :span

      def initialize(form, object_name, method_name, content_or_options = nil, options = nil)
        options ||= {
          'data-bs-toggle': 'popover',
          'data-bs-placement': 'top',
          'data-bs-html': 'true',
          'data-bs-content': ''
        }

        content_is_options = content_or_options.is_a?(Hash)
        if content_is_options
          # options.merge! content_or_options

          @label = content_or_options[:label]
          @attribute_content = content_or_options[:text]
        else
          @label = '?'
          @attribute_content = content_or_options
        end

        super(form, object_name, method_name, options)
      end

      def call
        content_or_options = content.presence || attribute_content.presence || content_from_translation.presence

        options['data-bs-content'] = content_or_options if content_or_options.present?

        tag.public_send(self.class.tag, @label, **options)
      end

      def render?
        content.present? || attribute_content.present? || content_from_translation.present?
      end

      def content_from_translation
        form.translate_from_namespace(method_name, namespace: :helps).presence
      end
    end
  end
end
