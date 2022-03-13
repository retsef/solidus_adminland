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
      object_name = @object_name.model_name.singular if @object_name.respond_to?(:model_name)

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

  def i18n_scope
    %i[admin form]
  end

  # From SimpleForm https://github.com/heartcombo/simple_form/blob/3238067743729ae294850693ecdb0fd6475940d4/lib/simple_form/inputs/base.rb#L174
  # Lookup translations for the given namespace using I18n, based on object name,
  # actual action and attribute name. Lookup priority as follows:
  #
  #   form.{namespace}.{model}.{action}.{attribute}
  #   form.{namespace}.{model}.{attribute}
  #   form.{namespace}.defaults.{attribute}
  #
  #  Namespace is used for :labels and :hints.
  #
  #  Model is the actual object name, for a @user object you'll have :user.
  #  Action is the action being rendered, usually :new or :edit.
  #  And attribute is the attribute itself, :name for example.
  #
  #  The lookup for nested attributes is also done in a nested format using
  #  both model and nested object names, such as follow:
  #
  #   form.{namespace}.{model}.{nested}.{action}.{attribute}
  #   form.{namespace}.{model}.{nested}.{attribute}
  #   form.{namespace}.{nested}.{action}.{attribute}
  #   form.{namespace}.{nested}.{attribute}
  #   form.{namespace}.defaults.{attribute}
  #
  #  Example:
  #
  #    form:
  #      labels:
  #        user:
  #          new:
  #            email: 'E-mail para efetuar o sign in.'
  #          edit:
  #            email: 'E-mail.'
  #
  #  Take a look at our locale example file.
  def translate_from_namespace(method_name, namespace: @options[:namespace])
    # object_name = self.object_name.model_name.singular if self.object_name.respond_to?(:model_name)
    lookups = []

    lookups << :"#{object_name}.#{method_name}"
    lookups << :"defaults.#{method_name}"

    I18n.t(lookups.shift, scope: [i18n_scope, namespace].compact, default: lookups, throw: true)
  rescue StandardError
    nil
  end
end
