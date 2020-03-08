class CreateComTeacherRelations < ActiveRecord::Migration[5.2]
  def change
    create_table :com_teacher_relations do |t|
      t.references :community, foreign_key: true
      t.references :teacher, foreign_key: true

      t.timestamps
    end
  end
end
