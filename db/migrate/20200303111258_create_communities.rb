class CreateCommunities < ActiveRecord::Migration[5.2]
  def change
    create_table :communities do |t|
      t.string :name
      t.text :introduction
      t.integer :auth_code
      t.boolean :openness

      t.timestamps
    end
  end
end
