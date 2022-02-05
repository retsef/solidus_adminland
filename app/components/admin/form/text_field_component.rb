# frozen_string_literal: true

class Admin::Form::TextFieldComponent < ViewComponent::Form::TextFieldComponent
  self.tag_klass = ActionView::Helpers::Tags::TextField

  def html_class
    "form-control #{'is-invalid' if method_errors?}"
  end
end
