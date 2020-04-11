class TopicsController < ApplicationController
  def index
    @results = Topic.all
    @kawai_topics = []
    @sundai_topics = []
    @tousin_topics = []
    @results.each do |topic|
      if topic.site_name == "河合塾"
        @kawai_topics.push(topic)
      elsif topic.site_name == "駿台"
        @sundai_topics.push(topic)
      elsif topic.site_name == "東進ハイスクール"
        @tousin_topics.push(topic)
      end
    end
  end
  
  def scrape_all
    Topic.delete_all
    Topic.scrape
    Topic.scrape_sundai
    Topic.scrape_tousin
    redirect_to topics_path
  end
end

