# frozen_string_literal: true

class Admin::Search::CollectionSelectComponent < ViewComponent::Form::CollectionSelectComponent
  self.tag_klass = ActionView::Helpers::Tags::CollectionSelect

  def html_class
    'form-control form-select'
  end
end
