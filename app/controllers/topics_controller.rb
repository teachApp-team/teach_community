class TopicsController < ApplicationController
  def index
    @results = Topic.scrape_sundai
  end
end

