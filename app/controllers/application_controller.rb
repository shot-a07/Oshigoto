class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller? # 初期設定からnameカラムがないため追記しています
  before_action :authenticate_user!,except: [:top, :about, :guest_login]
  
  
  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end

  # def log_in(user)
  #   session[:user_id] = user.id
  # end

  # def guest_user
  #     current_user == User.find_by(email: 'test@example.com')
  # end
end
