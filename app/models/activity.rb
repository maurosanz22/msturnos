class Activity < ApplicationRecord
  belongs_to :branch
  has_many :shifts

  def nombre_rubro
    area.nombre
  end
end
