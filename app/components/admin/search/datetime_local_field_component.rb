# frozen_string_literal: true

class Admin::Search::DatetimeLocalFieldComponent < ViewComponent::Form::DatetimeLocalFieldComponent
  self.tag_klass = ActionView::Helpers::Tags::DatetimeLocalField

  def html_class
    'form-control'
  end
end
