# frozen_string_literal: true

# https://getbootstrap.com/docs/5.1/forms/checks-radios/
class Admin::Search::CheckBoxComponent < ViewComponent::Form::CheckBoxComponent
  self.tag_klass = ActionView::Helpers::Tags::CheckBox

  def html_class
    'form-check-input'
  end
end
