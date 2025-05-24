class ApplicationController < ActionController::Base
    before_action :configure_permitted_parameters, if: :devise_controller?
  
    layout :layout_by_resource
  
    protected
  
    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :phone, :address])
      devise_parameter_sanitizer.permit(:account_update, keys: [:name, :phone, :address])
    end

  protected

  def after_sign_in_path_for(resource)
    if resource.admin?
      admin_dashboard_path 
    else
      root_path
    end
  end

  def after_sign_out_path_for(resource_or_scope)
    new_user_session_path
  end


    private
  
    def layout_by_resource
      if devise_controller?
        "application"  
      else
        "application"
      end
    end
  end
  