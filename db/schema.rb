# encoding: UTF-8
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

ActiveRecord::Schema.define(:version => 20120801065535) do

  create_table "challenges", :force => true do |t|
    t.integer  "position",       :null => false
    t.integer  "level",          :null => false
    t.text     "question",       :null => false
    t.text     "hints",          :null => false
    t.text     "solution",       :null => false
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
    t.string   "topic",          :null => false
    t.string   "input_pattern"
    t.string   "output_pattern"
    t.text     "result"
    t.text     "pre_condition"
  end

  add_index "challenges", ["level"], :name => "index_challenges_on_level"
  add_index "challenges", ["position"], :name => "index_challenges_on_position", :unique => true
  add_index "challenges", ["topic"], :name => "index_challenges_on_topic"

end
