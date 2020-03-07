class CreateEntries < ActiveRecord::Migration[5.2]
  def change
    create_table :entries do |t|
      t.references :student, foreign_key: true
      t.references :teacher, foreign_key: true
      t.references :room, foreign_key: true

      t.timestamps
    end
  end
end
