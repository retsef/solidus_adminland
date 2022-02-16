class Admin::FormBuilder < ViewComponent::Form::Builder
  # Set the namespace you want to use for your own components
  namespace 'Admin::Form'

  def error_message(method, options = {})
    render_component(:error_message, @object_name, method, objectify_options(options))
  end

  def hint(method, text = nil, options = {}, &block)
    render_component(:hint, @object_name, method, text, objectify_options(options), &block)
  end
end
