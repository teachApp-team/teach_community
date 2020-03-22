class StudentsController < ApplicationController
  def index
  end

  def show
    @student = Student.find(params[:id])
  end

  def new
    @student = Student.new
  end
  
  def create
    @student = Student.new(student_params)
    if @student.save
      flash[:notice] = "新規登録ありがとうございます"
      session[:student_id] = @student.id
      redirect_to @student
    else
      flash[:notice] = "登録失敗です"
      render :new
    end
  end

  def edit
    @student = Student.find(params[:id])
  end

  def update
    student = Student.find(params[:id])
    student.assign_attributes(image_params)
    if student.save
      flash[:notice] = "画像変更成功"
      redirect_to edit_student_path(student.id)
    else
      flash[:notice] = "画像変更失敗"
      redirect_to edit_student_path(student.id)
    end
  end

  def mypage
  end
  
  private
  
  def student_params
    params.require(:student).permit(:full_name, :nickname, :password, :password_confirmation, :teacher_id, :email, :high_school, :university)
  end
  
  def image_params
    params.require(:student).permit(:nickname, :full_name, :image)
  end
end
