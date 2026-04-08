class UsersController < ApplicationController
  before_action :authenticate_user, only: [:show_student]
  before_action :forbid_login_user, only: [:new_student, :new_teacher, :create_student, :create_teacher, :login_form_student, :login_form_teacher, :login_student, :login_teacher]
  before_action :ensure_correct_user,only: [:edit_student]
  
  

  def index
    @users = User.all
  end
  
  def show_student
    @user = User.find_by(id:params[:id])
  end

  def show_teacher
    @userT = UserT.find_by(id:params[:id])
    @belongs = Belong.find_by(teacherId:@userT.teacherId)
    @student = User.find_by(studentId: @belongs.studentId)
  end

  def new_student
    @user = User.new
  end

  def new_teacher
    @userT = UserT.new
  end
  
  def create_student
    @user = User.new(
      name: params[:name],
      email: params[:email],
      password: params[:password],
      studentId: params[:studentId],
      grade: params[:grade],
      student: params[:student]
    )
    if @user.save
      session[:user_id] = @user.id
      flash[:notice] = "ユーザー登録が完了しました"
      redirect_to("/users/#{@user.id}")
    else
      @error_message = "メールアドレスまたはパスワードが間違っています"
      render("users/new_student")
    end
  end

  def create_teacher
    
    @userT = UserT.new(
      name: params[:name],
      teacherId: params[:teacherId],
      email: params[:email],
      password: params[:password],
      student: params[:student]
    )
    
    if @userT.save
      session[:user_id] = @userT.id
      flash[:notice] = "ユーザー登録が完了しました"
      redirect_to("/users/#{@userT.id}")
    else
      render("users/new_teacher")
    end
  end
  
  def edit_student
    @user = User.find_by(id: params[:id])
  end

  def edit_teacher
    @userT = UserT.find_by(id: params[:id])
  end
  
  def update_student
    @user = User.find_by(id: params[:id])
    @user.name = params[:name]
    @user.email = params[:email]
    @user.grade = params[:grade]
    @user.teacher = params[:teacher]
    
    if @user.save
      flash[:notice] = "ユーザー情報を編集しました"
      redirect_to("/")
    else
      @error_message = "すでにアカウントが存在するメールアドレスです"
      render("users/show_student")
    end
  end

  def update_teacher
    @userT = User.find_by(id: params[:id])
    @userT.name = params[:name]
    @userT.email = params[:email]
    @userT.grade = params[:grade]
    @userT.teacher = params[:teacher]
    
    if @user.save
      flash[:notice] = "ユーザー情報を編集しました"
      redirect_to("/")
    else
      @error_message = "すでにアカウントが存在するメールアドレスです"
      render("users/show_student")
    end
  end

  def login_form_student
  end
  
  def login_form_teacher
  end
  
  def login_student
    @user = User.find_by(email: params[:email])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      flash[:notice] = "ログインしました"
      redirect_to("/")
    else
      @error_message = "メールアドレスまたはパスワードが間違っています"
      @email = params[:email]
      @password = params[:password]
      render("users/login_form_student")
    end
  end

  def login_teacher
    @userT = UserT.find_by(email: params[:email])
    if @userT && @userT.authenticate(params[:password])
      session[:user_id] = @userT.id
      flash[:notice] = "ログインしました"
      redirect_to("/")
    else
      @error_message = "メールアドレスまたはパスワードが間違っています"
      @email = params[:email]
      @password = params[:password]
      render("users/login_form_teacher")
    end
  end
  
  def logout
    session[:user_id] = nil
    flash[:notice] = "ログアウトしました"
    redirect_to("/login_form/student")
  end
  

  def add_student
    @userT = UserT.find_by(id: params[:id])
  end

  def add_new_student
    @belong = Belong.new(
      studentId: params[:studentId],
      teacherId: @current_userT.teacherId
    )
    if @belong.save
      flash[:notice] = "生徒登録が完了しました"
      @userT = UserT.find_by(id: params[:user_id])
      redirect_to("/users/teacher/#{@userT.id}")
    else
      @error_message = "生徒IDが間違っています"
      render("users/teacher/#{@userT.id}/add_student")
    end
  end

  
  def ensure_correct_user
    if @current_user
      if @current_user.id == params[:id].to_i
      elsif @current_userT.id == params[:id].to_i
      else
        flash[:notice] = "権限がありません"
        redirect_to("/")
      end
    end
  end

  def authenticate_user
    if @current_user != nil
    elsif @current_userT != nil
    else
      flash[:notice] = "ログインが必要です"
      redirect_to("/")
    end
  end
  
end
