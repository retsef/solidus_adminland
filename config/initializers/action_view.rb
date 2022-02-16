Rails.application.configure do |config|
  ActionView::Base.field_error_proc = ->(html_tag, _instance) { html_tag.html_safe }
end