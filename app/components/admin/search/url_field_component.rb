# frozen_string_literal: true

class Admin::Search::UrlFieldComponent < ViewComponent::Form::UrlFieldComponent
  self.tag_klass = ActionView::Helpers::Tags::UrlField

  def html_class
    'form-control'
  end
end
