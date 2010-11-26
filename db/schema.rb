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

ActiveRecord::Schema.define(:version => 20101122024407) do

  create_table "project_user", :force => true do |t|
    t.integer   "project_id", :limit => 2
    t.integer   "user_id",    :limit => 2
    t.timestamp "updated_at"
    t.timestamp "created_at"
  end

  create_table "projects", :force => true do |t|
    t.string    "name",          :limit => 80, :default => "",                      :null => false
    t.string    "status",        :limit => 0,  :default => "Requirement Gathering"
    t.integer   "created_by_id", :limit => 2
    t.integer   "owner_id",      :limit => 2
    t.timestamp "updated_at"
    t.timestamp "created_at"
  end

  create_table "users", :force => true do |t|
    t.string    "name",       :limit => 80,  :default => "",         :null => false
    t.string    "email",      :limit => 128, :default => "",         :null => false
    t.string    "role",       :limit => 0,   :default => "Employee"
    t.string    "department", :limit => 128
    t.timestamp "updated_at"
    t.timestamp "created_at"
  end

  add_index "users", ["email"], :name => "index_people_on_email", :unique => true

end
