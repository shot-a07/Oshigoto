class GuestSessionsController < ApplicationController
  #before_action :create#, raise: false

  def guest_login
    user = User.find_or_create_by(email: 'guest@example.com') do |user|
      user.password = SecureRandom.urlsafe_base64
      user.name = 'Guest'
      user.introduction = 'ゲストログイン中'
    end
    pp user
    # log_in(user)
    sign_in user
    flash[:success] = 'ゲストユーザーでログインしました'
    flash[:warning] = 'よろしくお願いします！'
    redirect_to root_path
  end

  # private

  # def login_required
  #   redirect_to login_path unless current_user
  # end

end
