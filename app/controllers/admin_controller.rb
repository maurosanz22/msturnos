class AdminController < ApplicationController
  def index
    @branches = current_user.companies.first.branches.all
  end
end
