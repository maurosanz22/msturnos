class AdminController < ApplicationController
  before_action :authentication_admin!

  def index
    @branches = current_user.companies.first.branches.all
    @users = User.joins(:userscompanies).where("userscompanies.company_id = ?", current_user.companies.first.id).where('permission_level <> ?', 2)
  end
end
