class Activity < ApplicationRecord
  belongs_to :branch
  has_many :shifts

  validates :Nombre, presence: { message: " es requerido" }, length:{ maximum:100, message: " es muy largo. Maximo 10 caracteres" }
  validates :cupo, presence: { message: " es requerido" }

  def nombre_rubro
    area.nombre
  end

end
