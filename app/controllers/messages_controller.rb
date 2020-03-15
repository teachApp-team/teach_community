class MessagesController < ApplicationController
    def create
        message = Message.new(message_params)
        if message.save
            redirect_to "/my_messages/#{message.student_id}"
        else
            flash[:notice] = "メッセージ送信できませんでした。"
            redirect_to "/my_messages/#{message.student_id}"
        end
    end
    
    def destroy
        message = Message.find(params[:id])
        message.destroy
        redirect_to "/my_messages/#{message.student_id}"
    end
    private
    def message_params
        params.require(:message).permit(:teacher_id, :student_id, :room_id, :content, :which)
    end
end
