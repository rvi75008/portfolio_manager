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

ActiveRecord::Schema[7.0].define(version: 2023_07_08_143244) do
  create_table "assets", force: :cascade do |t|
    t.string "name", null: false
    t.float "quantity", null: false
    t.float "unit_price", null: false
    t.float "unit_purchasing_price", null: false
    t.integer "currency_id", null: false
    t.string "account"
    t.string "type", null: false
    t.string "ticker"
    t.string "sector"
    t.string "sub_sector"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "portfolio_id", null: false
    t.index ["currency_id"], name: "index_assets_on_currency_id"
    t.index ["name"], name: "index_assets_on_name", unique: true
    t.index ["portfolio_id", "name"], name: "index_assets_on_portfolio_id_and_name", unique: true
    t.index ["portfolio_id"], name: "index_assets_on_portfolio_id"
  end

  create_table "currencies", force: :cascade do |t|
    t.string "code", null: false
    t.string "name", null: false
    t.string "symbol"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["code", "name", "symbol"], name: "index_currencies_on_code_and_name_and_symbol", unique: true
  end

  create_table "currency_rates", force: :cascade do |t|
    t.integer "base_currency_id", null: false
    t.integer "target_currency_id", null: false
    t.decimal "rate", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["base_currency_id", "target_currency_id"], name: "index_currency_rates_on_base_currency_id_and_target_currency_id", unique: true
    t.index ["base_currency_id"], name: "index_currency_rates_on_base_currency_id"
    t.index ["target_currency_id"], name: "index_currency_rates_on_target_currency_id"
  end

  create_table "owners", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["first_name", "last_name"], name: "index_owners_on_first_name_and_last_name", unique: true
  end

  create_table "portfolios", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.integer "owner_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "currency_id", null: false
    t.index ["currency_id"], name: "index_portfolios_on_currency_id"
    t.index ["name", "owner_id"], name: "index_portfolios_on_name_and_owner_id", unique: true
    t.index ["owner_id"], name: "index_portfolios_on_owner_id"
  end

  add_foreign_key "assets", "currencies"
  add_foreign_key "assets", "portfolios"
  add_foreign_key "currency_rates", "currencies", column: "base_currency_id"
  add_foreign_key "currency_rates", "currencies", column: "target_currency_id"
  add_foreign_key "portfolios", "currencies"
  add_foreign_key "portfolios", "owners"
end
