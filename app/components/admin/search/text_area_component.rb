# frozen_string_literal: true

class Admin::Search::TextAreaComponent < ViewComponent::Form::TextFieldComponent
  self.tag_klass = ActionView::Helpers::Tags::TextArea

  def html_class
    'form-control'
  end
end
