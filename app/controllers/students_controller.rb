class StudentsController < ApplicationController
  def index
  end

  def show
    @student = Student.find(params[:id])
  end

  def new
  end

  def edit
  end

  def mypage
  end
end
