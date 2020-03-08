class RoomsController < ApplicationController
    def show
        @teacher = Teacher.find(params[:id])
        # @messages = Message.find(params[:id])
        @message = Message.new
    end


end


