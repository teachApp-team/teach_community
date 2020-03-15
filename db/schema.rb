# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_03_15_112122) do

  create_table "com_student_relations", force: :cascade do |t|
    t.integer "community_id"
    t.integer "student_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["community_id"], name: "index_com_student_relations_on_community_id"
    t.index ["student_id"], name: "index_com_student_relations_on_student_id"
  end

  create_table "com_teacher_relations", force: :cascade do |t|
    t.integer "community_id"
    t.integer "teacher_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["community_id"], name: "index_com_teacher_relations_on_community_id"
    t.index ["teacher_id"], name: "index_com_teacher_relations_on_teacher_id"
  end

# Could not dump table "communities" because of following StandardError
#   Unknown type 'srting' for column 'image'

  create_table "entries", force: :cascade do |t|
    t.integer "student_id"
    t.integer "teacher_id"
    t.integer "room_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["room_id"], name: "index_entries_on_room_id"
    t.index ["student_id"], name: "index_entries_on_student_id"
    t.index ["teacher_id"], name: "index_entries_on_teacher_id"
  end

  create_table "messages", force: :cascade do |t|
    t.integer "student_id"
    t.integer "teacher_id"
    t.integer "room_id"
    t.text "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "which"
    t.index ["room_id"], name: "index_messages_on_room_id"
    t.index ["student_id"], name: "index_messages_on_student_id"
    t.index ["teacher_id"], name: "index_messages_on_teacher_id"
  end

  create_table "rooms", force: :cascade do |t|
    t.integer "student_id"
    t.integer "teacher_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["student_id"], name: "index_rooms_on_student_id"
    t.index ["teacher_id"], name: "index_rooms_on_teacher_id"
  end

  create_table "students", force: :cascade do |t|
    t.string "full_name"
    t.string "nickname"
    t.string "password_digest"
    t.string "email"
    t.string "high_school"
    t.string "university"
    t.integer "teacher_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "image"
    t.index ["teacher_id"], name: "index_students_on_teacher_id"
  end

  create_table "teachers", force: :cascade do |t|
    t.string "full_name"
    t.string "nickname"
    t.string "password_digest"
    t.string "email"
    t.text "introduction"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "image"
  end

end
