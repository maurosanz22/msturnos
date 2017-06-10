class Branch < ApplicationRecord
  belongs_to :company
  has_many :activities

  validates :nombre, presence: { message: " es requerido" }, length:{ maximum:50, message: " es muy largo. Maximo 50 caracteres" }
  validates :direccion, presence: { message: " es requerido" }, length:{ maximum:50, message: " es muy largo. Maximo 50 caracteres" }
  validates :telefono, presence: { message: " es requerido" }, length:{ maximum:15, message: " es muy largo. Maximo 15 caracteres" }
end
