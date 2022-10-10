class ApplicationController < ActionController::Base
    before_action :configure_permitted_parameters, if: :devise_controller?
    before_action :authenticate_user!, except: %i[index show] # Para no permitir que un usuario pueda realizar cambios sin antes autenticarse

  protected
  
  # Para permitir mas parametros en un formulario
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_in, keys: %i[email]) # Para logear usuario.
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[email username name avatar]) # Para crear un usuario.
    devise_parameter_sanitizer.permit(:account_update, keys: %i[email username name avatar]) # Para editar un usuario.
  end
end
