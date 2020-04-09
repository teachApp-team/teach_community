class GroupsController < ApplicationController
    def index
        @group = Group.all
    end
    
    def new
    end
    
    def create
        @group = Group.new(params.require(:group).permit(:name))
        @group.save
        redirect_to groups_path
    end
    
end
