class TopicsController < ApplicationController
  def index
    @results = Topic.all
  end
  
  def scrape_all
    Topic.delete_all
    Topic.scrape
    Topic.scrape_sundai
    Topic.scrape_tousin
    redirect_to topics_path
  end
end

