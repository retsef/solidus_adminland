# frozen_string_literal: true

class Admin::Form::HintComponent < ViewComponent::Form::HintComponent
  self.tag = :small

  def html_class
    'form-text text-muted'
  end
end
