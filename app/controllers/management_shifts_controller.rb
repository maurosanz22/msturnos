class ManagementShiftsController < ApplicationController
  # GET /management_shifts
  # GET /management_shifts.json
  def index
    @search_management_shift = SearchManagementShift.new
    @branches = current_user.get_company_user_admin.get_all_branchs
    @activities = []
    branch_id = params[:branch_id]
    
    if branch_id.present?
      @activities = current_user.get_company_user_admin.get_activities_by_branch(branch_id)
      puts @branch_id
    end
  end  
end
