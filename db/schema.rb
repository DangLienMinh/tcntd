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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 201510611111111063138) do

  create_table "active_admin_comments", force: :cascade do |t|
    t.string   "namespace"
    t.text     "body"
    t.string   "resource_id",   null: false
    t.string   "resource_type", null: false
    t.integer  "author_id"
    t.string   "author_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id", using: :btree
  add_index "active_admin_comments", ["namespace"], name: "index_active_admin_comments_on_namespace", using: :btree
  add_index "active_admin_comments", ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id", using: :btree

  create_table "admin_users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "name"
    t.integer  "is_admin",               default: 0
    t.integer  "page_id"
    t.integer  "failed_attempts",        default: 0
    t.string   "unlock_token"
    t.datetime "locked_at"
<<<<<<< HEAD
    t.string   "phone"
=======
<<<<<<< HEAD
    t.string   "phone"
=======
>>>>>>> f2cdcfde0d22fe0a11cba4157a06033ac4bc8fb6
>>>>>>> e7ddc68b0f45bd4ad86f30a700690d3be4a4e9c4
  end

  add_index "admin_users", ["email"], name: "index_admin_users_on_email", unique: true, using: :btree
  add_index "admin_users", ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true, using: :btree

  create_table "categories", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "url"
  end

  add_index "categories", ["url"], name: "index_categories_on_url", unique: true, using: :btree

  create_table "ckeditor_assets", force: :cascade do |t|
    t.string   "data_file_name",               null: false
    t.string   "data_content_type"
    t.integer  "data_file_size"
    t.integer  "assetable_id"
    t.string   "assetable_type",    limit: 30
    t.string   "type",              limit: 30
    t.integer  "width"
    t.integer  "height"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "ckeditor_assets", ["assetable_type", "assetable_id"], name: "idx_ckeditor_assetable", using: :btree
  add_index "ckeditor_assets", ["assetable_type", "type", "assetable_id"], name: "idx_ckeditor_assetable_type", using: :btree

  create_table "confighomes", force: :cascade do |t|
    t.integer  "numslider"
    t.integer  "numpostbox"
    t.string   "muctieu"
    t.string   "cacnghedt"
    t.string   "diachi"
    t.string   "phone"
    t.string   "email"
    t.string   "linkfb"
    t.string   "linktw"
    t.string   "copyright"
    t.integer  "trangthai"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "contacts", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "phone"
    t.string   "subject"
    t.text     "message"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "menus", force: :cascade do |t|
    t.string   "name"
    t.integer  "parent",     default: 0
    t.integer  "order"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.string   "url"
  end

  add_index "menus", ["url"], name: "index_menus_on_url", unique: true, using: :btree

  create_table "pages", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.text     "description"
    t.string   "slogan"
    t.string   "url"
    t.integer  "menu_id"
  end

  add_index "pages", ["url"], name: "index_pages_on_url", unique: true, using: :btree

  create_table "popups", force: :cascade do |t|
    t.string   "caption"
    t.string   "content"
    t.integer  "trangthai"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "posts", force: :cascade do |t|
    t.string   "name",                         null: false
    t.string   "summary",                      null: false
    t.text     "content",                      null: false
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.integer  "category_id",                  null: false
    t.integer  "admin_user_id",                null: false
    t.string   "pic_file_name"
    t.string   "pic_content_type"
    t.integer  "pic_file_size"
    t.datetime "pic_updated_at"
    t.integer  "page_id",                      null: false
    t.string   "url"
    t.integer  "is_new",           default: 0
  end

  add_index "posts", ["url"], name: "index_posts_on_url", unique: true, using: :btree

  create_table "slidercontents", force: :cascade do |t|
    t.string   "link"
    t.string   "topcaption"
    t.string   "botcaption"
    t.integer  "ordernum"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.string   "picture_file_name"
    t.string   "picture_content_type"
    t.integer  "picture_file_size"
    t.datetime "picture_updated_at"
  end

<<<<<<< HEAD
=======
<<<<<<< HEAD
=======
  create_table "sliders", force: :cascade do |t|
    t.string   "name"
    t.string   "infobig"
    t.string   "infosmall"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.string   "pic1_file_name"
    t.string   "pic1_content_type"
    t.integer  "pic1_file_size"
    t.datetime "pic1_updated_at"
    t.string   "pic2_file_name"
    t.string   "pic2_content_type"
    t.integer  "pic2_file_size"
    t.datetime "pic2_updated_at"
    t.string   "pic3_file_name"
    t.string   "pic3_content_type"
    t.integer  "pic3_file_size"
    t.datetime "pic3_updated_at"
    t.string   "pic4_file_name"
    t.string   "pic4_content_type"
    t.integer  "pic4_file_size"
    t.datetime "pic4_updated_at"
    t.string   "pic5_file_name"
    t.string   "pic5_content_type"
    t.integer  "pic5_file_size"
    t.datetime "pic5_updated_at"
  end

>>>>>>> f2cdcfde0d22fe0a11cba4157a06033ac4bc8fb6
>>>>>>> e7ddc68b0f45bd4ad86f30a700690d3be4a4e9c4
  create_table "videohds", force: :cascade do |t|
    t.string   "caption"
    t.string   "link"
    t.integer  "ordernum"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
