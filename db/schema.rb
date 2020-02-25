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

ActiveRecord::Schema.define(version: 2020_02_22_152912) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "batches", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "flow_id"
    t.integer "number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["flow_id"], name: "index_batches_on_flow_id"
    t.index ["user_id"], name: "index_batches_on_user_id"
  end

  create_table "checklists", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "flow_id"
    t.string "taskline"
    t.boolean "answer"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "task_id"
    t.index ["flow_id"], name: "index_checklists_on_flow_id"
    t.index ["task_id"], name: "index_checklists_on_task_id"
    t.index ["user_id"], name: "index_checklists_on_user_id"
  end

  create_table "flows", force: :cascade do |t|
    t.bigint "user_id"
    t.string "status"
    t.string "title"
    t.text "description"
    t.string "backgroundImage"
    t.string "teaser"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_flows_on_user_id"
  end

  create_table "forms", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "flow_id"
    t.string "question"
    t.string "answer"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "task_id"
    t.index ["flow_id"], name: "index_forms_on_flow_id"
    t.index ["task_id"], name: "index_forms_on_task_id"
    t.index ["user_id"], name: "index_forms_on_user_id"
  end

  create_table "images", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "flow_id"
    t.bigint "task_id"
    t.string "image"
    t.string "title"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["flow_id"], name: "index_images_on_flow_id"
    t.index ["task_id"], name: "index_images_on_task_id"
    t.index ["user_id"], name: "index_images_on_user_id"
  end

  create_table "interactions", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "flow_id"
    t.bigint "task_id"
    t.bigint "batch_id"
    t.string "interactionType"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["batch_id"], name: "index_interactions_on_batch_id"
    t.index ["flow_id"], name: "index_interactions_on_flow_id"
    t.index ["task_id"], name: "index_interactions_on_task_id"
    t.index ["user_id"], name: "index_interactions_on_user_id"
  end

  create_table "ratings", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "flow_id"
    t.integer "rating"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["flow_id"], name: "index_ratings_on_flow_id"
    t.index ["user_id"], name: "index_ratings_on_user_id"
  end

  create_table "tasks", force: :cascade do |t|
    t.bigint "flow_id"
    t.bigint "user_id"
    t.string "status"
    t.string "title"
    t.text "description"
    t.string "backgroundImage"
    t.integer "time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "order"
    t.index ["flow_id"], name: "index_tasks_on_flow_id"
    t.index ["user_id"], name: "index_tasks_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "firstName"
    t.string "lastName"
    t.string "nickName"
    t.string "email"
    t.string "password"
    t.string "avatarUrl"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "videos", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "flow_id"
    t.bigint "task_id"
    t.string "video"
    t.string "title"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["flow_id"], name: "index_videos_on_flow_id"
    t.index ["task_id"], name: "index_videos_on_task_id"
    t.index ["user_id"], name: "index_videos_on_user_id"
  end

  add_foreign_key "batches", "flows"
  add_foreign_key "batches", "users"
  add_foreign_key "checklists", "flows"
  add_foreign_key "checklists", "tasks"
  add_foreign_key "checklists", "users"
  add_foreign_key "flows", "users"
  add_foreign_key "forms", "flows"
  add_foreign_key "forms", "tasks"
  add_foreign_key "forms", "users"
  add_foreign_key "images", "flows"
  add_foreign_key "images", "tasks"
  add_foreign_key "images", "users"
  add_foreign_key "interactions", "batches"
  add_foreign_key "interactions", "flows"
  add_foreign_key "interactions", "tasks"
  add_foreign_key "interactions", "users"
  add_foreign_key "ratings", "flows"
  add_foreign_key "ratings", "users"
  add_foreign_key "tasks", "flows"
  add_foreign_key "tasks", "users"
  add_foreign_key "videos", "flows"
  add_foreign_key "videos", "tasks"
  add_foreign_key "videos", "users"
end
