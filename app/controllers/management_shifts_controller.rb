class ManagementShiftsController < ApplicationController
  # GET /management_shifts
  # GET /management_shifts.json
  def index
    @search_management_shift = SearchManagementShift.new
    @branches = current_user.get_company_user_admin.get_all_branchs
    @activities = []
    @shifts = []
    branch_id = params[:branch_id]
    
    if branch_id.present?
      @activities = current_user.get_company_user_admin.get_activities_by_branch(branch_id)
      puts @branch_id
    end

    activity_id = params[:activity_id]
    if activity_id.present?
      @shifts = current_user.get_company_user_admin.get_shifts_by_activity(branch_id, activity_id)
    end
  end  
end
