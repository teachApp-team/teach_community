class CreateComStudentRelations < ActiveRecord::Migration[5.2]
  def change
    create_table :com_student_relations do |t|
      t.references :community, foreign_key: true
      t.references :student, foreign_key: true

      t.timestamps
    end
  end
end
