# frozen_string_literal: true

class Admin::Form::PasswordFieldComponent < ViewComponent::Form::PasswordFieldComponent
  self.tag_klass = ActionView::Helpers::Tags::PasswordField

  def html_class
    "form-control #{'is-invalid' if method_errors?}"
  end
end
