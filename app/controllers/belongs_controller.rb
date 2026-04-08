class BelongsController < ApplicationController

  def create
    student = User.find_by(studentId: params[:studentId])
    if current_user.follow(student)
      redirect_to("/users/teacher/#{@userT.id}")
    else
      render("users/edit")
    end
  end
  
  def destroy
    student = User.find(studentId: params[:studentId])
    if current_user.unfollow(student)
      redirect_to("/users/teacher/#{@userT.id}")
    else
      render()
  end
  
  def teachers
    student = User.find_by(studentId: params[:studentId])
    @students =  student.teachers
  end
  
  def students
    teacher = User.find_by(teacherId: params[:teacherId])
    @students = teacher.students
  end

    def add_student
        @userT = UserT.find_by(id: params[:id])
    end

    def new_student
    
        @belong = Belong.new(
          studentId: params[:studentId],
          teacherId: @current_userT.id
        )
        if @belong.save
          flash[:notice] = "生徒登録が完了しました"
          redirect_to("/users/teacher/#{@userT.id}")
        else
          @error_message = "生徒IDが間違っています"
          render("users/teacher/#{@userT.id}/add_student")
        end
      end
end
