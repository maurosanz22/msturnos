class ShiftsController < ApplicationController
  before_action :set_branches

  def new
  	@shift = Shift.new
  	
    @activities = current_user.get_company_user_admin.get_all_activities 
  end

  def index
  end

  def show
    @shift = Shift.find(params[:id])
    @clients = []
    users_shift = UserShift.where("shift_id = ?", params[:id])

    users_shift.each do |us|
      @clients.push(User.find(us.user_id))
    end 
  end

  def create
    shift = Shift.new

    if params[:activity_id].present? && params[:fecha_d].present? && params[:fecha_h].present? && params[:hora_inicio].present? && params[:hora_fin].present? && (params[:lunes_c].present? || params[:martes_c].present? || params[:miercoles_c].present? || params[:jueves_c].present? || params[:viernes_c].present? || params[:sabado_c].present? || params[:domingo_c])
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
      redirect_to management_shifts_path, notice: "Los turnos se generaron correctamente"
    else
      @shift = Shift.new
      @shift.errors.add(:hora_inicio , :blank, message: "Todos los campos son requeridos")

      render :new 
    end
  end

  def destroy
    shift = Shift.find(params[:id])
    puts params[:id]
    shift.destroy if shift.present?
    respond_to do |format|
      format.html { redirect_to :back, notice: 'El turno se borro correctamente.' }
      format.json { head :no_content }
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
