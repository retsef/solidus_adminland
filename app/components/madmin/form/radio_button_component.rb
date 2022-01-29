# frozen_string_literal: true

class Madmin::Form::RadioButtonComponent < ViewComponent::Form::RadioButtonComponent
  self.tag_klass = ActionView::Helpers::Tags::RadioButton

  def html_class
    'form-control'
  end
end
