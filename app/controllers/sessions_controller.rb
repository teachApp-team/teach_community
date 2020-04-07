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
  
  def omni_create
    auth = request.env['omniauth.auth']
    if auth.present?
      user = User.find_or_create_from_auth(request.env['omniauth.auth'])
      session[:user_id] = user.id
      redirect_back_or user
    else #既存パタン
      user = User.find_by(email: params[:session][:email].downcase)
      if user && user.authenticate(params[:session][:password])
        log_in user
        params[:session][:remember_me] == '1' ? remember(user) : forget(user)
        redirect_back_or user
      else
        flash.now[:danger] = 'メールアドレスとパスワードの組み合わせは有効ではありません'
        render 'new'
      end
    end
  end
end
