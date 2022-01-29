# frozen_string_literal: true

class Madmin::Form::TextAreaComponent < ViewComponent::Form::TextFieldComponent
  self.tag_klass = ActionView::Helpers::Tags::TextArea

  def html_class
    'form-control'
  end
end
