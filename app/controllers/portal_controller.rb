class PortalController < ApplicationController
  def index
    @companies = Company.joins(:userscompanies).where("userscompanies.user_id = ?", current_user.id)
  end

  def search_company
    @areas = Area.all
    @companies = []
    area_id = params[:area_id]
    nombre = params[:nombre]

    if nombre.present?
      @companies = Company.where("razon_social LIKE ?", "%#{nombre}%")
    elsif area_id.present?
      @companies = Company.where(area_id: area_id)
    end
  end

  def follow_company
    company_id = params[:company_id]
    user_id = current_user.id

    if company_id.present?
      Userscompany.create(user_id: user_id, company_id: company_id )

      redirect_to portal_path
    else
      redirect_to :back
    end
  end
end
