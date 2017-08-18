class ManagementShiftsController < ApplicationController
  # GET /management_shifts
  # GET /management_shifts.json
  def index
    @branches = current_user.get_company_user_admin.get_all_branchs
    @branch = @branches
    @activities = []
    @shifts = []
   
    activity_id = params[:activity_id]
    
    if activity_id.present?
      @shifts = Shift.new.get_shifts_by_branch_activity_since_until(activity_id, params[:since], params[:until]).order('fecha, hora_inicio')
      @branch = []
      @branch.push(Branch.find(params[:branch_id]))
    end
  end  
end
