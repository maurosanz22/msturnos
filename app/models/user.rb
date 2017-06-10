class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :userscompanies
  has_many :companies, through: :userscompanies
  include PermissionsConcern

  def get_company_user_admin 
    companies.first
  end
end
