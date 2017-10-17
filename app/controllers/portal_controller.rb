class PortalController < ApplicationController
	before_action :set_company, only: (:search_shifts)

  def index
    @companies = Company.joins(:userscompanies).where("userscompanies.user_id = ?", current_user.id)
    @user_shifts = current_user.get_shifts_user
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

  def search_shifts
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

  def reserve_shifts
    user_id = current_user.id
    shift_ids = []
    shift_ids = params[:shift_ids]
    puts shift_ids
    shift_ids.each do |shift_id|
	    if user_id.present? && shift_id.present?
	      @usershift = UserShift.create(user_id: user_id, shift_id: shift_id)
	    else
	      redirect_to :back
	    end
	end
	redirect_to portal_path
  end

  private

  def set_company
  	@company = Company.find(params[:id])
  end

end
