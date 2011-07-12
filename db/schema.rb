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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20110425234659) do

  create_table "comments", :force => true do |t|
    t.integer   "commentable_id",   :null => false
    t.string    "commentable_type"
    t.integer   "user_id"
    t.string    "comment"
    t.timestamp "updated_at"
    t.timestamp "created_at"
  end

  create_table "events", :force => true do |t|
    t.string    "name"
    t.integer   "start_date"
    t.integer   "start_time"
    t.integer   "end_time"
    t.string    "status",     :limit => 0, :default => "In Process"
    t.timestamp "updated_at"
    t.timestamp "created_at"
  end

  create_table "milestones", :force => true do |t|
    t.integer   "created_by"
    t.string    "name"
    t.integer   "assigned_to"
    t.integer   "project_id"
    t.timestamp "due_date"
    t.timestamp "updated_at"
    t.timestamp "created_at"
  end

  create_table "project_user", :force => true do |t|
    t.integer   "project_id", :limit => 2
    t.integer   "user_id"
    t.timestamp "updated_at"
    t.timestamp "created_at"
  end

  create_table "projects", :force => true do |t|
    t.string    "name",          :limit => 80, :default => "", :null => false
    t.string    "description",                 :default => "", :null => false
    t.string    "status"
    t.integer   "created_by_id", :limit => 2
    t.integer   "owner_id",      :limit => 2
    t.datetime  "live_date"
    t.timestamp "updated_at"
    t.timestamp "created_at"
  end

  create_table "tasks", :force => true do |t|
    t.string    "name"
    t.string    "description"
    t.integer   "difficulty"
    t.integer   "created_by"
    t.integer   "assigned_to"
    t.integer   "project_id"
    t.integer   "milestone_id"
    t.string    "status",       :limit => 0, :default => "to_do"
    t.timestamp "updated_at"
    t.timestamp "created_at"
  end

  create_table "uploaded_files", :force => true do |t|
    t.integer   "user_id"
    t.string    "asset_file_name",    :default => "", :null => false
    t.string    "asset_content_type", :default => "", :null => false
    t.integer   "asset_file_size"
    t.datetime  "asset_updated_at"
    t.timestamp "updated_at"
    t.timestamp "created_at"
  end

  create_table "users", :force => true do |t|
    t.string    "name",                 :limit => 80,  :default => "", :null => false
    t.string    "company",              :limit => 80,  :default => "", :null => false
    t.string    "title",                               :default => "", :null => false
    t.string    "department",           :limit => 128
    t.string    "email",                               :default => "", :null => false
    t.string    "phone",                :limit => 100, :default => "", :null => false
    t.string    "encrypted_password",   :limit => 128, :default => "", :null => false
    t.string    "password_salt",                       :default => "", :null => false
    t.string    "reset_password_token"
    t.string    "remember_token"
    t.datetime  "remember_created_at"
    t.integer   "sign_in_count",                       :default => 0
    t.datetime  "current_sign_in_at"
    t.datetime  "last_sign_in_at"
    t.string    "current_sign_in_ip"
    t.string    "last_sign_in_ip"
    t.timestamp "updated_at"
    t.timestamp "created_at"
  end

  add_index "users", ["email"], :name => "index_people_on_email", :unique => true

end
