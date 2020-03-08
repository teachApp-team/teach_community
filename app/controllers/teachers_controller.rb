class TeachersController < ApplicationController
  def index
  end

  def show

    @teacher = Teacher.find(params[:id])
  end
  
  def my_students
    @teacher = Teacher.find(params[:id])
  end

  def new
  end

  def edit
    @teacher = Teacher.find(params[:id])
  end
  
  def update
    @teacher = Teacher.find(params[:id])
    @teacher.assign_attributes(image_params)
    if @teacher.save
      flash[:notice] = "画像変更成功しました!"
      redirect_to edit_teacher_path(params[:id])
    else
      flash[:notice] = "画像変更失敗しました。"
      redirect_to edit_teacher_path(params[:id])
    end
  end

  def mypage
  end
  
  private
  
  def image_params
    params.require(:teacher).permit(:image, :nickname, :full_name)
  end
  
  def name_params
    params.require(:teacher).permit(:nickname, :full_name)
  end
end
