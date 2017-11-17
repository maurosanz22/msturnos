class PortalController < ApplicationController
	before_action :set_company, only: [:search_shifts]
  before_action :authentication_user!

  def index
    @companies = Company.joins(:userscompanies).where("userscompanies.user_id = ?", current_user.id)
    user_shifts = current_user.get_shifts_user

    @current_shifts = user_shifts.where(fecha: DateTime.now..Date.current.end_of_day) 
    @future_shifts = user_shifts.where('fecha > ?',  Date.current.end_of_day)
    @pass_shifts = user_shifts.where('fecha < ?', DateTime.now)
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
      if !Userscompany.where("user_id = ? AND company_id = ?", user_id, company_id).present?
        Userscompany.create(user_id: user_id, company_id: company_id )
      end
      redirect_to portal_path
    else
      redirect_to :back
    end
  end 

  def search_shifts
  	if (params[:search] == 'true') && (!params[:since].present? || !params[:until].present? || !params[:activity_id].present? || !params[:branch_id].present?)
      redirect_to search_shifts_path(@company.id, 'false'), alert: 'Por favor complete todos los filtros.' 
    else
      @branches = @company.get_all_branchs
      @activities = @company.get_all_activities
      @branch = @branches
      @activities = []
      @shifts = []

      activity_id = params[:activity_id]
      
      if activity_id.present?
        @shifts = Shift.new.get_shifts_by_branch_activity_since_until(activity_id, params[:since], params[:until])
        @branch = []
        @branch.push(Branch.find(params[:branch_id]))
      end
    end
  end

  def reserve_shifts
    user_id = current_user.id
    shift_ids = []
    shift_ids = params[:shift_ids]
    success = false

    if shift_ids.present?
      shift_ids.each do |shift_id|
        user_shift = UserShift.new(user_id: user_id, shift_id: shift_id)
        
        if !user_shift.save
            redirect_to portal_path, alert: 'No se puede reservar' 
        else
          success = true
        end 
      end    
    end

    if success
      redirect_to portal_path, notice: 'Se reservo correctamente'
    else
      redirect_to portal_path, alert: 'No se puede reservar'
    end
  end

  def delete_shift
    UserShift.where("user_id = ? AND shift_id = ?", current_user.id, params[:shift_id]).first.destroy
    respond_to do |format|
      format.html { redirect_to portal_path, notice: 'Se borro correctamente' }
      format.json { head :no_content }
    end
  end
  private

  def set_company
  	@company = Company.find(params[:id])
  end
end
