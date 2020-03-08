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
  end

  def mypage
  end
end
