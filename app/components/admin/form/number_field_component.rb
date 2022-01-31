# frozen_string_literal: true

class Admin::Form::NumberFieldComponent < ViewComponent::Form::NumberFieldComponent
  self.tag_klass = ActionView::Helpers::Tags::NumberField

  def html_class
    'form-control'
  end
end
