class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :user_shift
  has_many :shifts, through: :user_shift
  has_many :userscompanies
  has_many :companies, through: :userscompanies
  include PermissionsConcern

  def get_company_user_admin 
    companies.first
  end

  def get_shifts_user
    shifts.order('fecha').order('hora_inicio')
  end
end
