class SessionsController < ApplicationController
  def create
    teacher = Teacher.find_by(nickname: params[:session][:nickname])
    student = Student.find_by(nickname: params[:session][:nickname])
    if teacher && teacher.authenticate(params[:session][:password])
      session[:teacher_id] = teacher.id
      flash[:notice] = "先生として正常にログインしました。"
      redirect_to teacher
    elsif student && student.authenticate(params[:session][:password])
      session[:student_id] = student.id
      flash[:notice] = "生徒として正常にログインしました。"
      redirect_to student
    else
      flash[:notice] = "ログインできませんでした。"
      redirect_to root_path
    end
  end

  def destroy
    if @current_teacher
      session.delete(:teacher_id)
      redirect_to root_path
    elsif
      session.delete(:student_id)
      redirect_to root_path
    end
  end
end
