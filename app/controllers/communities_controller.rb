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
    @com = Community.find(params[:id])
  end

  def new
    @new_com = Community.new
  end

  def edit
    @com = Community.find(params[:id])
  end
  
  def add
    unless @current_student
      redirect_to root_path
    end
    com = Community.find(params[:add][:community_id])
    stu = Student.find(params[:add][:student_id])
    if com.auth_code.present?
      if com.auth_code.to_s == params[:add][:auth_code]
        com.students << stu
        flash[:notice] = "コミュニティに参加しました。"
        redirect_to community_path(com.id)
      else
        flash[:notice] = "認証コードが違います"
        redirect_to communities_path
      end
    elsif com.openness
      flash[:notice] = "自由コミュニティに参加しました。"
      com.students << stu
      redirect_to community_path(com.id)
    else
      flash[:notice] = "ダメー"
      redirect_to communities_path
    end
  end
  
  def update
    com = Community.find(params[:id])
    com.assign_attributes(image_params)
    if com.save
      flash[:notice] = "画像変更成功"
      redirect_to edit_community_path(com.id)
    else
      flash[:notice] = "画像変更失敗"
      redirect_to edit_community_path(com.id)
    end
  end
  
  def image_params
    params.require(:community).permit(:image, :name, :introduction, :auth_code, :openness)
  end
end
