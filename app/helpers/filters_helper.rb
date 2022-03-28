module FiltersHelper
  def render_filter(field, input_type, locals = {})
    locals[:field] = field

    case input_type
    when 'Administrate::Field::BelongsTo'
      locals[:association] = locals[:model].reflections[field.to_s]
      render locals: locals, partial: 'filters/field_belongs_to'
    when 'Administrate::Field::Boolean'
      render locals: locals, partial: 'filters/field_boolean'
    when 'Administrate::Field::Date'
      render locals: locals, partial: 'filters/field_date'
    when 'Administrate::Field::DateTime'
      render locals: locals, partial: 'filters/field_datetime'
    when 'Administrate::Field::Email', 'Administrate::Field::String', 'Administrate::Field::Text'
      render locals: locals, partial: 'filters/field_string'
    when 'Administrate::Field::Number'
      render locals: locals, partial: 'filters/field_number'
    when 'Administrate::Field::Money'
      render locals: locals, partial: 'filters/field_money'
    when 'Administrate::Field::HasMany'
      locals[:association] = locals[:model].reflections[field.to_s]
      render locals: locals, partial: 'filters/field_has_many'
    when 'Administrate::Field::Select'
		  render locals: locals, partial: 'filters/field_select'
    else
		  render locals: locals, partial: 'filters/field_other'
    end
  end
end
