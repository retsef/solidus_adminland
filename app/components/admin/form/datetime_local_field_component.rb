# frozen_string_literal: true

class Admin::Form::DatetimeLocalFieldComponent < ViewComponent::Form::DatetimeLocalFieldComponent
  self.tag_klass = ActionView::Helpers::Tags::DatetimeLocalField

  def html_class
    "form-control #{'is-invalid' if method_errors?}"
  end
end
