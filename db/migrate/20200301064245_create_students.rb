class CreateStudents < ActiveRecord::Migration[5.2]
  def change
    create_table :students do |t|
      t.string :full_name
      t.string :nickname
      t.string :password_digest
      t.string :email
      t.string :high_school
      t.string :university
      t.references :teacher, foreign_key: true

      t.timestamps
    end
  end
end
