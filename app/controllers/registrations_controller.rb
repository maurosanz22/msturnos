class RegistrationsController < Devise::RegistrationsController
  before_filter :configure_permitted_parameters
  
  def new
      puts "registration controller - new"
      @company_id = params[:company_id]
      @email = params[:email]

      super      
  end

  def create
      puts "registration controller - create"
      @email = params[:user][:email]
      
      build_resource(sign_up_params)
      company_id = params[:company_id]
      
      resource.save
      yield resource if block_given?
      if resource.persisted?
        if resource.active_for_authentication?
          puts 'mauro' + company_id
          if !company_id.nil? and !company_id.empty?
            Userscompany.create(user_id: resource.id, company_id: company_id )
            User.find(resource.id).update(permission_level: 2)
          end
          set_flash_message! :notice, :signed_up
          redirect_to new_user_session_path
        else
          set_flash_message! :notice, :"signed_up_but_#{resource.inactive_message}"
          expire_data_after_sign_in!
          respond_with resource, location: after_inactive_sign_up_path_for(resource)
        end
      else
        clean_up_passwords resource
        set_minimum_password_length
        respond_with resource
      end
  end

  protected

  def sign_up(resource_name, resource)
    puts "registration controller - sig up"
  end
  
  def after_sign_up_path_for(resource)
    puts "registration controller - after sig up"    
  end

  def after_update_path_for(resource)
    puts "registration controller - after update"
    super
  end
end