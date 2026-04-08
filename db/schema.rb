# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.2].define(version: 2025_02_04_151406) do
  create_table "belongs", force: :cascade do |t|
    t.string "teacherId"
    t.string "studentId"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "exams", force: :cascade do |t|
    t.string "grade"
    t.string "term"
    t.string "examType"
    t.string "subject"
    t.integer "goal"
    t.integer "result"
    t.integer "gap"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "rails", force: :cascade do |t|
    t.string "g"
    t.string "controller"
    t.string "Belong"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "reports", force: :cascade do |t|
    t.date "classDate"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.time "classTime"
    t.text "classSubject"
    t.text "classContent"
    t.text "classHomework"
    t.text "classComment"
    t.boolean "done"
    t.string "user_id"
  end

  create_table "student_teachers", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "user_t_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_student_teachers_on_user_id"
    t.index ["user_t_id"], name: "index_student_teachers_on_user_t_id"
  end

  create_table "teacher_students", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "userT_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["userT_id"], name: "index_teacher_students_on_userT_id"
    t.index ["user_id"], name: "index_teacher_students_on_user_id"
  end

  create_table "user_ts", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "teacherId"
    t.string "studentId"
    t.string "password_digest"
    t.boolean "student"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "teacher"
    t.string "grade"
    t.integer "teacherId"
    t.string "studentId"
    t.string "password_digest"
    t.boolean "student"
  end

  add_foreign_key "student_teachers", "user_ts"
  add_foreign_key "student_teachers", "users"
  add_foreign_key "teacher_students", "userTs"
  add_foreign_key "teacher_students", "users"
end
