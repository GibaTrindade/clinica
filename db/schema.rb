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

ActiveRecord::Schema.define(version: 20131221032427) do

  create_table "diagnosticos", force: true do |t|
    t.string   "nome"
    t.string   "cid"
    t.boolean  "estado"
    t.integer  "paciente_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "diagnosticos", ["paciente_id"], name: "index_diagnosticos_on_paciente_id", using: :btree

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
  end

end
