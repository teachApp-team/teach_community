class StudentsController < ApplicationController
  def index
  end

  def show
    @student = Student.find(params[:id])
  end

  def new
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
  
  def image_params
    params.require(:student).permit(:nickname, :full_name, :image)
  end
end
