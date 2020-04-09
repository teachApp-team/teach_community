class RoomsController < ApplicationController
    def show
        # @teacher = Teacher.find(params[:id])
        @teacher = @current_teacher
        # @messages = Message.find(params[:id])
        @message = Message.new
        @new_message = Message.new
        @this_student = Student.find(params[:student_id])
        @messages = Message.where(student_id: params[:student_id], teacher_id: @current_teacher.id)
    end



end