class ChangeToTopic < ActiveRecord::Migration[5.2]
  def change
    remove_column :topics, :TopicSite_id, :integer
  end
end
