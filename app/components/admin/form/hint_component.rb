# frozen_string_literal: true

class Admin::Form::HintComponent < ViewComponent::Form::HintComponent
  self.tag = :small

  def html_class
    'form-text text-muted'
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
