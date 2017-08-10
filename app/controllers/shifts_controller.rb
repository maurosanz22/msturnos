class ShiftsController < ApplicationController
  before_action :set_branches

  def new
  	@shift = Shift.new
  	
    @activities = current_user.get_company_user_admin.get_all_activities 
  end

  def index
  end

  def create
    @activity = Activity.find(params[:activity_id])
    start_date = Date.parse(params[:fecha_d])
    end_date = Date.parse(params[:fecha_h])
    hora_inicio = Time.parse(params[:hora_inicio])
    hora_fin = Time.parse(params[:hora_fin])
    set_days

    (start_date..end_date).each do |day|
      if @dias.include? day.wday
        shift = Shift.new
        shift.fecha = day
        shift.hora_inicio = hora_inicio
        shift.hora_fin = hora_fin
        shift.activity_id = @activity.id

        shift.save
      end
    end
  end

  private

  def shift_params
    params.permit(:fecha_d, :fecha_h, :hora_inicio, :hora_fin, :lunes_c, :martes_c, :miercoles_c, :jueves_c, :viernes_c, :sabado_c, :domingo_c)
  end

  def set_branches
    @branches = current_user.get_company_user_admin.get_all_branchs
  end

  def set_days
    @dias = []

    if params[:lunes_c]
      @dias.push(1)
    end
    if params[:martes_c]
      @dias.push(2)
    end
    if params[:miercoles_c]
      @dias.push(3)
    end
    if params[:jueves_c]
      @dias.push(4)
    end
    if params[:viernes_c]
      @dias.push(5)
    end
    if params[:sabado_c]
      @dias.push(6)
    end
    if params[:domingo_c]
      @dias.push(0)
    end
  end
end
