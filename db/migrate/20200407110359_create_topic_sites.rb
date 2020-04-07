class CreateTopicSites < ActiveRecord::Migration[5.2]
  def change
    create_table :topic_sites do |t|
      t.string :name
      t.string :base_url

      t.timestamps
    end
  end
end
