# frozen_string_literal: true

class Admin::Form::FileFieldComponent < ViewComponent::Form::FileFieldComponent
  self.tag_klass = ActionView::Helpers::Tags::FileField

  def html_class
    "form-control #{'is-invalid' if method_errors?}"
  end
end
