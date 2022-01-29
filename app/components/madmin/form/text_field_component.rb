# frozen_string_literal: true

class Madmin::Form::TextFieldComponent < ViewComponent::Form::TextFieldComponent
  self.tag_klass = ActionView::Helpers::Tags::TextField

  def html_class
    'form-control'
  end
end
