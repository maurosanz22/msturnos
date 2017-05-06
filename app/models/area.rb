class Area < ApplicationRecord
    validates :codigo, presence: { message: " es requerido" }, length:{ maximum:10, message: " es muy largo. Maximo 10 caracteres" }
    validates :nombre, presence: { message: " es requerido" }, length:{ maximum:50, message: " es muy largo. Maximo 50 caracteres" }
end
