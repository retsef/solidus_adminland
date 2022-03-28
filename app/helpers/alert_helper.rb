module AlertHelper
  def alert_class(key)
    case key
    when :success then 'success'
    when :error then 'danger'
    else 'info'
    end
  end
end
