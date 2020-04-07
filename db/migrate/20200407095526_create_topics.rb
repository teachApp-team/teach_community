class CreateTopics < ActiveRecord::Migration[5.2]
  def change
    create_table :topics do |t|
      t.string :site_name
      t.string :title
      t.text :content
      t.string :link_url

      t.timestamps
    end
  end
end
