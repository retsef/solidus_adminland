# frozen_string_literal: true

# https://getbootstrap.com/docs/5.1/forms/checks-radios/
class Madmin::Form::CheckBoxComponent < ViewComponent::Form::CheckBoxComponent
  self.tag_klass = ActionView::Helpers::Tags::CheckBox

  def html_class
    'form-check'
  end
end
