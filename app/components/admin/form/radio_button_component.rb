# frozen_string_literal: true

class Admin::Form::RadioButtonComponent < ViewComponent::Form::RadioButtonComponent
  self.tag_klass = ActionView::Helpers::Tags::RadioButton

  def html_class
    "form-control #{'is-invalid' if method_errors?}"
  end
end
