class CommunitiesController < ApplicationController
  def index
    @coms = Community.all
    if @current_teacher.present?
      @myComs = @current_teacher.communities
    elsif @current_student.present?
      @myComs = @current_student.communities
    end
  end

  def show
  end

  def new
    @new_com = Community.new
  end

  def edit
  end
end
