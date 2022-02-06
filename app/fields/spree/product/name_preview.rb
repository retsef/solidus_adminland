require 'administrate/field/string'

class Spree::Product::NamePreview < Administrate::Field::String
  def to_s
    data
  end

  def to_partial_path
    "/fields/spree/product/name_preview/#{page}"
  end
end
