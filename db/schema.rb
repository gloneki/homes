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

ActiveRecord::Schema.define(:version => 20130407180917) do

  create_table "accounts", :force => true do |t|
    t.boolean  "status"
    t.integer  "user_id"
    t.integer  "situation_id"
    t.integer  "plan_id"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  add_index "accounts", ["plan_id"], :name => "index_accounts_on_plan_id"
  add_index "accounts", ["situation_id"], :name => "index_accounts_on_situation_id"
  add_index "accounts", ["user_id"], :name => "index_accounts_on_user_id"

  create_table "addresses", :force => true do |t|
    t.string   "country"
    t.string   "state"
    t.string   "city"
    t.string   "neighborhood"
    t.string   "street"
    t.string   "number"
    t.string   "complement"
    t.string   "postal_code"
    t.integer  "home_id"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "affiliates", :force => true do |t|
    t.string   "name"
    t.date     "date_affiliate"
    t.string   "file"
    t.string   "description"
    t.boolean  "status"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  create_table "banner_files", :force => true do |t|
    t.string   "file"
    t.string   "description"
    t.integer  "banner_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "banner_files", ["banner_id"], :name => "index_banner_files_on_banner_id"

  create_table "banners", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "highlight_files", :force => true do |t|
    t.string   "file"
    t.string   "description"
    t.integer  "highlight_id"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  add_index "highlight_files", ["highlight_id"], :name => "index_highlight_files_on_highlight_id"

  create_table "highlights", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "homes", :force => true do |t|
    t.string   "code"
    t.integer  "account_id"
    t.integer  "type_home_id"
    t.integer  "type_service_id"
    t.integer  "owner_id"
    t.string   "description"
    t.float    "price"
    t.boolean  "status"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  add_index "homes", ["account_id"], :name => "index_homes_on_account_id"
  add_index "homes", ["owner_id"], :name => "index_homes_on_owner_id"
  add_index "homes", ["type_home_id"], :name => "index_homes_on_type_home_id"
  add_index "homes", ["type_service_id"], :name => "index_homes_on_type_service_id"

  create_table "module_extensions", :force => true do |t|
    t.string   "name"
    t.string   "description"
    t.string   "tag_name"
    t.boolean  "status"
    t.boolean  "visible"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "owner_addresses", :force => true do |t|
    t.string   "country"
    t.string   "state"
    t.string   "city"
    t.string   "neighborhood"
    t.string   "street"
    t.string   "number"
    t.string   "complement"
    t.string   "postal_code"
    t.integer  "owner_id"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "owner_contacts", :force => true do |t|
    t.string   "type_contact"
    t.string   "contact_value"
    t.integer  "owner_id"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  add_index "owner_contacts", ["owner_id"], :name => "index_owner_contacts_on_owner_id"

  create_table "owners", :force => true do |t|
    t.string   "name"
    t.string   "document"
    t.string   "email"
    t.boolean  "status"
    t.integer  "account_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "owners", ["account_id"], :name => "index_owners_on_account_id"

  create_table "plans", :force => true do |t|
    t.string   "code"
    t.string   "name"
    t.float    "price"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "setting_shop_contacts", :force => true do |t|
    t.string   "type_contact"
    t.string   "contact_value"
    t.integer  "account_id"
    t.integer  "setting_shop_id"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  add_index "setting_shop_contacts", ["account_id"], :name => "index_setting_shop_contacts_on_account_id"
  add_index "setting_shop_contacts", ["setting_shop_id"], :name => "index_setting_shop_contacts_on_setting_shop_id"

  create_table "setting_shops", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "document"
    t.string   "country"
    t.string   "state"
    t.string   "postal_code"
    t.string   "city"
    t.string   "neighborhood"
    t.string   "street"
    t.string   "number"
    t.string   "complement"
    t.string   "logo"
    t.string   "showcase"
    t.text     "hour_service"
    t.string   "localization"
    t.string   "social_contact"
    t.integer  "account_id"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  add_index "setting_shops", ["account_id"], :name => "index_setting_shops_on_account_id"

  create_table "settings", :force => true do |t|
    t.string   "name"
    t.string   "description"
    t.string   "setting_value"
    t.integer  "account_id"
    t.string   "setting_type"
    t.integer  "ref_id"
    t.boolean  "status"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  add_index "settings", ["account_id"], :name => "index_settings_on_account_id"

  create_table "type_homes", :force => true do |t|
    t.string   "name"
    t.string   "tag"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "type_services", :force => true do |t|
    t.string   "name"
    t.string   "tag"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

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
    t.boolean  "is_active"
  end

end
