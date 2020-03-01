class CreateTeachers < ActiveRecord::Migration[5.2]
  def change
    create_table :teachers do |t|
      t.string :full_name
      t.string :nickname
      t.string :password_digest
      t.string :email
      t.text :introduction

      t.timestamps
    end
  end
end
