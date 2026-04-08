class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
 
  before_action :set_current_user

  
  def set_current_user
    @student = session[:user_student]
    if @student.present?
      @current_user = User.find_by(id: session[:user_id])
    else
      @current_userT = UserT.find_by(id: session[:user_id])
    end

  end
  
  def authenticate_user
    if @current_user == nil
      flash[:notice] = "ログインが必要です"
      redirect_to("/login_form/student")
    end
  end
  
  def forbid_login_user
    if @current_user
      flash[:notice] = "すでにログインしています"
      redirect_to("/")
    end
  end
end
