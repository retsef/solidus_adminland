# frozen_string_literal: true

class Admin::Form::TextAreaComponent < ViewComponent::Form::TextFieldComponent
  self.tag_klass = ActionView::Helpers::Tags::TextArea

  def html_class
    "form-control #{'is-invalid' if method_errors?}"
  end
end
