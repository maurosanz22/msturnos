class SuperAdminController < ApplicationController
  before_action :authentication_super_admin!
  
  def index
    @companies_count = Company.count
    @users_count = User.count
    @shifts_count = Shift.count
    @areas_count = Area.count
  end

  def new_admin
    
  end
end
