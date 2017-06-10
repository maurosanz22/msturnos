class BranchesController < ApplicationController
  before_action :set_branch, only: [:show, :edit, :update, :destroy]
  before_action :set_company

  # GET /branches
  # GET /branches.json
  def index
    @branches = @company.branches.all
  end

  # GET /branches/1
  # GET /branches/1.json
  def show
    @activities = @branch.activities.all
  end

  # GET /branches/new
  def new
    @branch = Branch.new    
  end

  # GET /branches/1/edit  
  def edit
  end

  # POST /branches
  # POST /branches.json
  def create
    @branch = Branch.new(branch_params)
    @branch.company = @company
    
    respond_to do |format|
      if @branch.save
        format.html { redirect_to branches_path, notice: 'Se guardo correctamente' }
        format.json { render :show, status: :created, location: @branch }
      else
        format.html { render :new }
        format.json { render json: @branch.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /branches/1
  # PATCH/PUT /branches/1.json
  def update
    respond_to do |format|
      if @branch.update(branch_params)
        format.html { redirect_to @branch, notice: 'Se guardo correctamente.' }
        format.json { render :show, status: :ok, location: @branch }
      else
        format.html { render :edit }
        format.json { render json: @branch.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /branches/1
  # DELETE /branches/1.json
  def destroy
    Activity.where(branch_id: @branch.id).destroy_all
    @branch.destroy
    respond_to do |format|
      format.html { redirect_to branches_url, notice: 'Branch was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def create_activity
    @activity = Activity.new(branch_id: params[:branch_id], Nombre: params[:nombre], cupo: params[:cupo], duracion_minutos: params[:duracion_minutos])

    respond_to do |format|
      if @activity.save
        format.html { redirect_to Branch.find(@activity.branch_id), notice: 'Se guardo correctamente.' }
        format.json { render :show, status: :created, location: @activity }
      else
        format.html { render :new }
        format.json { render json: @activity.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_branch
      @branch = Branch.find(params[:id])
    end

    def set_company
      if user_signed_in?
          @company = Company.find(current_user.companies.first.id)
        end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def branch_params
      params.require(:branch).permit(:nombre, :direccion, :telefono, :company_id)
    end
end
