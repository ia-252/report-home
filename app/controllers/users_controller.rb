class UsersController < ApplicationController
  before_action :authenticate_user, only: [
    :show_student, :show_teacher,
    :add_student, :add_new_student
  ]

  before_action :forbid_login_user, only: [
    :new_student, :new_teacher,
    :create_student, :create_teacher,
    :login_form_student, :login_form_teacher,
    :login_student, :login_teacher
  ]

  before_action :ensure_correct_user, only: [
    :edit_student, :update_student,
    :edit_teacher, :update_teacher
  ]

  def index
    @users = User.all
  end

  def show_student
    @user = User.find_by(id: params[:id])
  end

  def show_teacher
    @userT = UserT.find_by(id: params[:id])

    if @userT
      @belongs = Belong.where(teacherId: @userT.teacherId)
      @students = User.where(studentId: @belongs.pluck(:studentId))
    else
      flash[:notice] = "ユーザーが見つかりません"
      redirect_to("/")
    end
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
      session[:userT_id] = nil
      flash[:notice] = "ユーザー登録が完了しました"
      redirect_to("/users/#{@user.id}")
    else
      @error_message = "ユーザー登録に失敗しました"
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
      session[:userT_id] = @userT.id
      session[:user_id] = nil
      flash[:notice] = "ユーザー登録が完了しました"
      redirect_to("/users/teacher/#{@userT.id}")
    else
      @error_message = "ユーザー登録に失敗しました"
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
      render("users/edit_student")
    end
  end

  def update_teacher
    @userT = UserT.find_by(id: params[:id])

    @userT.name = params[:name]
    @userT.email = params[:email]

    if @userT.save
      flash[:notice] = "ユーザー情報を編集しました"
      redirect_to("/")
    else
      @error_message = "すでにアカウントが存在するメールアドレスです"
      render("users/edit_teacher")
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
      session[:userT_id] = nil
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
      session[:userT_id] = @userT.id
      session[:user_id] = nil
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
    session[:userT_id] = nil
    flash[:notice] = "ログアウトしました"
    redirect_to("/login_form/student")
  end

  def add_student
    unless @current_userT
      flash[:notice] = "先生アカウントでログインしてください"
      redirect_to("/")
      return
    end

    @userT = @current_userT
  end

  def add_new_student
    unless @current_userT
      flash[:notice] = "先生アカウントでログインしてください"
      redirect_to("/")
      return
    end

    @belong = Belong.new(
      studentId: params[:studentId],
      teacherId: @current_userT.teacherId
    )

    if @belong.save
      flash[:notice] = "生徒登録が完了しました"
      redirect_to("/users/teacher/#{@current_userT.id}")
    else
      @error_message = "生徒IDが間違っています"
      @userT = @current_userT
      render("users/add_student")
    end
  end

  def ensure_correct_user
    if @current_user && @current_user.id == params[:id].to_i
      return
    elsif @current_userT && @current_userT.id == params[:id].to_i
      return
    else
      flash[:notice] = "権限がありません"
      redirect_to("/")
    end
  end

  def authenticate_user
    unless @current_user || @current_userT
      flash[:notice] = "ログインが必要です"
      redirect_to("/")
    end
  end
end