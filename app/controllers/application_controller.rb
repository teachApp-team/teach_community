class ApplicationController < ActionController::Base
    before_action :current_teacher
    before_action :current_student
    before_action :set_cors
    
    def current_teacher
        return unless session[:teacher_id]
        @current_teacher = Teacher.find(session[:teacher_id])
    end
    def current_student
        return unless session[:student_id]
        @current_student = Student.find(session[:student_id])
    end
    
    def set_cors
      headers['Access-Control-Allow-Origin'] = '*'
      headers['Access-Control-Request-Method'] = '*'
    end
end

