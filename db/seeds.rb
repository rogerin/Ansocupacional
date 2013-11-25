# encoding: UTF-8
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# Conta Admin padrao
User.create email: "comercial@analisesistemas.com", nome: "admin", login: "admin", password_digest: "admin123", tipo: 1, status: 1

cat1 = Categoria.create nome: "Outro"
cat2 = Categoria.create nome: "Admissional"
cat3 = Categoria.create nome: "Mudança de Função"
cat4 = Categoria.create nome: "Demissional"