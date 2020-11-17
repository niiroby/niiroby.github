# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_11_17_141935) do

  create_table "spree_users", force: :cascade do |t|
    t.string "encrypted_password", limit: 128
    t.string "password_salt", limit: 128
    t.string "email"
    t.string "remember_token"
    t.string "persistence_token"
    t.string "reset_password_token"
    t.string "perishable_token"
    t.integer "sign_in_count", default: 0, null: false
    t.integer "failed_attempts", default: 0, null: false
    t.datetime "last_request_at"
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.string "login"
    t.integer "ship_address_id"
    t.integer "bill_address_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "authentication_token"
    t.string "unlock_token"
    t.datetime "locked_at"
    t.datetime "remember_created_at"
    t.datetime "reset_password_sent_at"
    t.datetime "deleted_at"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.index ["bill_address_id"], name: "index_spree_users_on_bill_address_id"
    t.index ["deleted_at"], name: "index_spree_users_on_deleted_at"
    t.index ["email"], name: "email_idx_unique", unique: true
    t.index ["ship_address_id"], name: "index_spree_users_on_ship_address_id"
  end

end
