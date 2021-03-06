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

ActiveRecord::Schema.define(version: 20140109050258) do

  create_table "anamneses", force: true do |t|
    t.text     "queixa"
    t.integer  "paciente_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
  end

  add_index "anamneses", ["paciente_id"], name: "index_anamneses_on_paciente_id", using: :btree
  add_index "anamneses", ["user_id"], name: "index_anamneses_on_user_id", using: :btree

  create_table "diagnosticos", force: true do |t|
    t.string   "nome"
    t.string   "cid"
    t.boolean  "estado"
    t.integer  "paciente_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
  end

  add_index "diagnosticos", ["paciente_id"], name: "index_diagnosticos_on_paciente_id", using: :btree
  add_index "diagnosticos", ["user_id"], name: "index_diagnosticos_on_user_id", using: :btree

  create_table "exames", force: true do |t|
    t.string   "nome"
    t.float    "resultado"
    t.string   "unidade"
    t.integer  "paciente_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
  end

  add_index "exames", ["paciente_id"], name: "index_exames_on_paciente_id", using: :btree
  add_index "exames", ["user_id"], name: "index_exames_on_user_id", using: :btree

  create_table "pacientes", force: true do |t|
    t.string   "nome"
    t.string   "cpf"
    t.string   "email"
    t.integer  "idade"
    t.string   "sexo"
    t.string   "telf"
    t.string   "telc"
    t.string   "convenio"
    t.boolean  "ativo"
    t.string   "estadocivil"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
  end

  add_index "pacientes", ["user_id"], name: "index_pacientes_on_user_id", using: :btree

  create_table "rails_admin_histories", force: true do |t|
    t.text     "message"
    t.string   "username"
    t.integer  "item"
    t.string   "table"
    t.integer  "month",      limit: 2
    t.integer  "year",       limit: 8
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "rails_admin_histories", ["item", "table", "month", "year"], name: "index_rails_admin_histories", using: :btree

  create_table "users", force: true do |t|
    t.string   "username",                        null: false
    t.string   "email",              default: "", null: false
    t.string   "encrypted_password", default: "", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "role"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["username"], name: "index_users_on_username", unique: true, using: :btree

end
