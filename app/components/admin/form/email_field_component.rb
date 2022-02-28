# frozen_string_literal: true

class Admin::Form::EmailFieldComponent < ViewComponent::Form::EmailFieldComponent
  self.tag_klass = ActionView::Helpers::Tags::EmailField

  def html_class
    "form-control #{'is-invalid' if method_errors?}"
  end
end
