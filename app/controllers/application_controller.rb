class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

	def after_sign_in_path_for(resource_or_scope)
    if current_user.is_normal_super_admin?  
			super_admin_path  
		elsif current_user.is_normal_admin? 
			admin_path 
		elsif current_user.is_normal_user?
			portal_path
		end 
  end

	def after_sign_up_path_for(resource_or_scope)
    new_user_session_path
  end

  protected 

	def authentication_user!
		redirect_to admin_path unless user_signed_in? && current_user.is_normal_user?
	end

	def authentication_admin!
		redirect_to new_user_session_path unless user_signed_in? && current_user.is_normal_admin?
	end

  def authentication_super_admin!
		redirect_to new_user_session_path unless user_signed_in? && current_user.is_normal_super_admin?
	end
end
