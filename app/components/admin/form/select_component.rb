# frozen_string_literal: true

class Admin::Form::SelectComponent < ViewComponent::Form::SelectComponent
  self.tag_klass = ActionView::Helpers::Tags::Select

  def html_class
    'form-control form-select'
  end
end
