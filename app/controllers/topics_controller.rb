class TopicsController < ApplicationController
  def index
    @results = Topic.all
    
  end
end

