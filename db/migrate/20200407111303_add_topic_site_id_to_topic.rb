class AddTopicSiteIdToTopic < ActiveRecord::Migration[5.2]
  def change
    add_reference :topics, :TopicSite, foreign_key: true
  end
end
