class CreateFavorites < ActiveRecord::Migration[5.2]
  def change
    create_table :favorites do |t|
      t.references :teacher, foreign_key: true
      t.string :video_id
      t.text :intro

      t.timestamps
    end
  end
end
