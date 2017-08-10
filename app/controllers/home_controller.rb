class HomeController < ApplicationController
  before_action :redirect_to_correct_path

  def index
    puts "home controller - index"
  end

  def redirect_to_correct_path
    puts "REDIRECT CORRECT"
    if user_signed_in?
      if current_user.is_normal_super_admin?  
        puts "SUPER ADMIN"
        redirect_to super_admin_path
      elsif current_user.is_normal_admin? 
        puts "ADMIN USER"
        redirect_to admin_path 
      elsif current_user.is_normal_user?
        puts "NORMAL USER"
        redirect_to portal_path
      end 
    end
  end
end
