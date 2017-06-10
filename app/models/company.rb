class Company < ApplicationRecord
  belongs_to :area
  has_many :branches
  has_many :userscompanies
  has_many :users, through: :userscompanies
  accepts_nested_attributes_for :area, :reject_if => proc { |attrs| attrs['codigo'].blank? && attrs['nombre'].blank? }
  
  validates :razon_social, presence: { message: " es requerido" }, length:{ maximum:100, message: " es muy largo. Maximo 100 caracteres" }
  validates :cuit, presence: { message: " es requerido" }, length:{ maximum:13, message: " es muy largo. Maximo 13 caracteres" }
  validates :titular, presence: { message: " es requerido" }, length:{ maximum:100, message: " es muy largo. Maximo 100 caracteres" }
  validates :email, presence: { message: " es requerido" }, length:{ maximum:50, message: " es muy largo. Maximo 50 caracteres" }
  validates :telefono, presence: { message: " es requerido" }, length:{ maximum:50, message: " es muy largo. Maximo 50 caracteres" }
  validates :celular, presence: { message: " es requerido" }, length:{ maximum:50, message: " es muy largo. Maximo 50 caracteres" }
  validates :area, presence: { message: " es requerido" }, length:{ maximum:50, message: " es muy largo. Maximo 50 caracteres" }

  def nombre_rubro
    area.nombre
  end

  def get_all_branchs
    branches.all
  end

  def get_activities_by_branch(branch_id)
    branches.find(branch_id).activities.all
  end

  def get_all_activities
    activities = []
    get_all_branchs.each do |b|
      b.activities.all.each do |a|
        activities << a
      end
    end

    return activities
  end

end
