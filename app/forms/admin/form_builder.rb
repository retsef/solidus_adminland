class Admin::FormBuilder < ViewComponent::Form::Builder
  # Set the namespace you want to use for your own components
  namespace 'Admin::Form'

  def error_message(method, options = {})
    render_component(:error_message, @object_name, method, objectify_options(options))
  end

  def hint(method, text = nil, options = {}, &block)
    render_component(:hint, @object_name, method, text, objectify_options(options), &block)
  end

  # Backport field_id from Rails 7.0
  if Rails::VERSION::MAJOR < 7
    def field_id(method_name, *suffixes, namespace: @options[:namespace], index: @index)
      object_name = object_name.model_name.singular if object_name.respond_to?(:model_name)

      sanitized_object_name = object_name.to_s.gsub(/\]\[|[^-a-zA-Z0-9:.]/, '_').delete_suffix('_')

      sanitized_method_name = method_name.to_s.delete_suffix('?')

      [
        namespace,
        sanitized_object_name.presence,
        (index unless sanitized_object_name.empty?),
        sanitized_method_name,
        *suffixes
      ].tap(&:compact!).join('_')
    end
  end
end
