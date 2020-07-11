class ApplicationController < ActionController::API
        include DeviseTokenAuth::Concerns::SetUserByToken

        before_action :configure_permitted_parameters, if: :devise_controller?

        def configure_permitted_parameters
                devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :email, :password, :password_confirmation, :avatar])
                devise_parameter_sanitizer.permit(:account_update, keys: [:name, :email, :password, :password_confirmation, :avatar])
        end
end
