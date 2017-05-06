class Company < ApplicationRecord
  belongs_to :area

  def nombre_rubro
    area.nombre
  end
end
