# frozen_string_literal: true

class Admin::Form::ErrorMessageComponent < ViewComponent::Form::ErrorMessageComponent
  def html_class
    'invalid-feedback'
  end
end
