class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
	before_action :configure_permitted_parameters, if: :devise_controller?

	def after_sign_in_path_for(resource_or_scope)
    if current_user.is_normal_super_admin?  
			super_admin_path  
		elsif current_user.is_normal_admin? 
			admin_path 
		elsif current_user.is_normal_user?
			portal_path
		end 
  end
	
  protected 

	def authentication_user!
		redirect_to root_path unless user_signed_in? && current_user.is_normal_user?
	end

	def authentication_admin!
		redirect_to root_path unless user_signed_in? && current_user.is_normal_admin?
	end

  def authentication_super_admin!
		redirect_to root_path unless user_signed_in? && current_user.is_normal_super_admin?
	end

	def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:company_id, :email])
  end
end
