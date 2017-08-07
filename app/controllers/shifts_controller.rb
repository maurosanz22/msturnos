class ShiftsController < ApplicationController
  before_action :set_branches

  def new
  	@shift = Shift.new
  	
    @activities = current_user.get_company_user_admin.get_all_activities 
  end

  def create
    @activity = Activity.find(params[:activity_id])
    @shift = Shift.new(shift_params)
    @shift.activity_id = @activity.id
    puts "Lucio"
    puts @shift.inspect
    respond_to do |format|
      if @shift.save
        format.html { redirect_to management_shifts_path, notice: 'Shift was successfully created.' }
        format.json { render :show, status: :created, location: @shift }
      else
        format.html { render :new }
        format.json { render json: @shift.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def shift_params
    params.permit(:fecha, :hora_inicio, :hora_fin)
  end

  def set_branches
    @branches = current_user.get_company_user_admin.get_all_branchs
  end
end
