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

ActiveRecord::Schema.define(:version => 20121108095410) do

  create_table "admins", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
  end

  add_index "admins", ["email"], :name => "index_admins_on_email", :unique => true
  add_index "admins", ["reset_password_token"], :name => "index_admins_on_reset_password_token", :unique => true

  create_table "jobs", :force => true do |t|
    t.string   "no",                      :null => false
    t.string   "url",                     :null => false
    t.string   "kind"
    t.string   "name"
    t.string   "address"
    t.string   "tel"
    t.string   "fax"
    t.text     "business_description"
    t.string   "job_type"
    t.string   "employment_type1"
    t.string   "industry"
    t.string   "employment_type2"
    t.string   "employment_term"
    t.string   "age_conditions"
    t.string   "age_conditions_reasons"
    t.string   "office_hours"
    t.string   "recess"
    t.string   "overtime_work"
    t.string   "office_days_of_week"
    t.string   "wage"
    t.string   "bonus"
    t.string   "holiday"
    t.string   "two_holidays_of_week"
    t.string   "holidays_of_year"
    t.string   "childcare_leave_results"
    t.string   "usable_day_care_center"
    t.string   "office_address"
    t.string   "transfer"
    t.string   "employees"
    t.string   "enrollment_insurance"
    t.string   "age_limit_system"
    t.string   "reemployment"
    t.string   "dormitory"
    t.string   "traveling_by_car"
    t.string   "commuting"
    t.string   "recruitment_amount"
    t.string   "job_description"
    t.string   "educational_background"
    t.string   "required_experience"
    t.string   "required_lisences"
    t.string   "special_report"
    t.string   "receipted_at"
    t.string   "receipted_by"
    t.string   "expires_at"
    t.datetime "created_at",              :null => false
    t.datetime "updated_at",              :null => false
    t.string   "full_address"
    t.string   "zipcode"
    t.string   "pref"
    t.string   "city"
  end

  add_index "jobs", ["no"], :name => "index_jobs_on_no", :unique => true
  add_index "jobs", ["url"], :name => "index_jobs_on_url", :unique => true

  create_table "rails_admin_histories", :force => true do |t|
    t.text     "message"
    t.string   "username"
    t.integer  "item"
    t.string   "table"
    t.integer  "month",      :limit => 2
    t.integer  "year",       :limit => 8
    t.datetime "created_at",              :null => false
    t.datetime "updated_at",              :null => false
  end

  add_index "rails_admin_histories", ["item", "table", "month", "year"], :name => "index_rails_admin_histories"

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

  create_table "zipcodes", :force => true do |t|
    t.string   "jis_code",     :null => false
    t.string   "zip_code_old", :null => false
    t.string   "zip_code",     :null => false
    t.string   "pref_kana",    :null => false
    t.string   "city_kana",    :null => false
    t.string   "town_kana",    :null => false
    t.string   "pref",         :null => false
    t.string   "city",         :null => false
    t.string   "town",         :null => false
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

end
