# frozen_string_literal: true

class Admin::Form::LabelComponent < ViewComponent::Form::LabelComponent
  def html_class
    "form-label #{'required' if required?} #{'optional' if optional?}"
  end
end
