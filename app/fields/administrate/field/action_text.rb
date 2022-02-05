require 'administrate/field/base'

class Administrate::Field::ActionText < Administrate::Field::Base
  def to_s
    data
  end
end
