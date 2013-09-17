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

ActiveRecord::Schema.define(:version => 20130915022052) do

  create_table "assets", :force => true do |t|
    t.string   "asset_file_name"
    t.string   "asset_content_type"
    t.integer  "asset_file_size"
    t.datetime "asset_updated_at"
    t.integer  "consulta_id"
    t.integer  "categoria_id"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
    t.date     "data"
  end

  create_table "categorias", :force => true do |t|
    t.string   "nome"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "consultas", :force => true do |t|
    t.integer  "funcionario_id"
    t.integer  "empresa_id"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end


  create_table "empresas", :force => true do |t|
    t.string   "nome"
    t.string   "cnpj"
    t.string   "email"
    t.string   "login"
    t.string   "password_digest"
    t.integer  "user_id"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  create_table "exames", :force => true do |t|
    t.string   "link"
    t.integer  "categoria_id"
    t.integer  "funcionario_id"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
    t.integer  "empresa_id"
    t.string   "pdf_file_name"
    t.string   "pdf_content_type"
    t.integer  "pdf_file_size"
    t.datetime "pdf_updated_at"
  end

  create_table "funcionarios", :force => true do |t|
    t.string   "nome"
    t.string   "rg"
    t.integer  "empresa_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "matricula"
  end

  create_table "users", :force => true do |t|
    t.string   "nome"
    t.string   "email"
    t.string   "password_digest"
    t.string   "login"
    t.integer  "tipo"
    t.string   "link"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
    t.integer  "status"
  end

end
