class CommentsController < ApplicationController
    def show
        @comments = Comment.where(group_id: params[:id])
        @comment = Comment.new
        @current = params[:id]
    end
    
    def new
    end
    
    def create
        @comment = Comment.new(body: params[:comment][:body],group_id: params[:comment][:group_id],student_id: params[:comment][:student_id])
        @comment.save
        redirect_to "/comments/#{@comment.group_id}"
    end 
end
