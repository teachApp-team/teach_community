class CommunitiesController < ApplicationController
  def index
    @coms = Community.all
  end

  def show
  end

  def new
    @new_com = Community.new
  end

  def edit
  end
end
