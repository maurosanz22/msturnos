class ShiftTypesController < ApplicationController
  before_action :set_shift_type, only: [:show, :edit, :update, :destroy]

  # GET /shift_types
  # GET /shift_types.json
  def index
    @shift_types = ShiftType.all
  end

  # GET /shift_types/1
  # GET /shift_types/1.json
  def show
  end

  # GET /shift_types/new
  def new
    @shift_type = ShiftType.new
  end

  # GET /shift_types/1/edit
  def edit
  end

  # POST /shift_types
  # POST /shift_types.json
  def create
    @shift_type = ShiftType.new(shift_type_params)

    respond_to do |format|
      if @shift_type.save
        format.html { redirect_to shift_types_path, notice: 'Se guardo correctamente.' }
        format.json { render :show, status: :created, location: @shift_type }
      else
        format.html { render :new }
        format.json { render json: @shift_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /shift_types/1
  # PATCH/PUT /shift_types/1.json
  def update
    respond_to do |format|
      if @shift_type.update(shift_type_params)
        format.html { redirect_to @shift_type, notice: 'Shift type was successfully updated.' }
        format.json { render :show, status: :ok, location: @shift_type }
      else
        format.html { render :edit }
        format.json { render json: @shift_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /shift_types/1
  # DELETE /shift_types/1.json
  def destroy
    @shift_type.destroy
    respond_to do |format|
      format.html { redirect_to shift_types_url, notice: 'Se borro correctamente.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_shift_type
      @shift_type = ShiftType.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def shift_type_params
      params.require(:shift_type).permit(:codigo, :nombre)
    end
end
