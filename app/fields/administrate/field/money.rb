require 'administrate/field/number'

class Administrate::Field::Money < Administrate::Field::Number
  delegate :currency, to: :money

  def to_s
    money.format(symbol: symbol, separator: separator, delimiter: delimiter)
  end

  def money
    @money ||= ::Spree::Money.new(data || 0, currency: code)
  end

  def code
    options.fetch(:code, ::Spree::Config[:currency] || ::Money.default_currency.iso_code)
  end

  def symbol
    options.fetch(:symbol, currency.symbol)
  end

  def delimiter
    options.fetch(:delimiter, currency.thousands_separator)
  end

  def separator
    options.fetch(:separator, currency.decimal_mark)
  end
end
