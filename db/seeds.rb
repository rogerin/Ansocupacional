# encoding: UTF-8
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# Conta Admin padrao
User.create email: "comercial@analisesistemas.com", nome: "admin", login: "admin", password: "admin123", password_confirmation: "admin123", tipo: 1, status: 1

# Cria novas clinicas
cli1  = User.create email: "cli1@cli1.com", nome: "cli1", login: "cli1", password: "cli1", password_confirmation: "cli1", tipo: 2, status: 1
cli2  = User.create email: "cli2@cli2.com", nome: "cli2", login: "cli2", password: "cli2", password_confirmation: "cli2", tipo: 2, status: 1
cli3  = User.create email: "cli3@cli2.com", nome: "cli3", login: "cli3", password: "cli3", password_confirmation: "cli3", tipo: 2, status: 1
cli4  = User.create email: "cli4@cli2.com", nome: "cli4", login: "cli4", password: "cli4", password_confirmation: "cli4", tipo: 2, status: 1
#cli5  = User.create email: "cli5@cli2.com", nome: "cli5", login: "cli5", password: "cli5", password_confirmation: "cli5", tipo: 2, status: 1
#cli6  = User.create email: "cli6@cli2.com", nome: "cli6", login: "cli6", password: "cli6", password_confirmation: "cli6", tipo: 2, status: 1

# Cria empresas para clinica 1
emp1  = Empresa.create nome: "emp1_cli1", cnpj: "emp1_cli1", email: "emp1_cli1", login: "emp1_cli1", password: "emp1_cli1", password_confirmation: "emp1_cli1", user_id: cli1.id, status: 1
	(1..5).each do |f|
		Funcionario.create nome: "fun#{f}_emp1_cli1", rg: "fun#{f}_emp1_cli1", matricula: "fun#{f}_emp1_cli1", empresa_id: emp1.id
	end

emp2  = Empresa.create nome: "emp2_cli1", cnpj: "emp2_cli1", email: "emp2_cli1", login: "emp2_cli1", password: "emp2_cli1", password_confirmation: "emp2_cli1", user_id: cli1.id, status: 1
	(6..11).each do |f|
		Funcionario.create nome: "fun#{f}_emp2_cli1", rg: "fun#{f}_emp2_cli1", matricula: "fun#{f}_emp2_cli1", empresa_id: emp2.id
	end
	
emp3  = Empresa.create nome: "emp3_cli1", cnpj: "emp3_cli1", email: "emp3_cli1", login: "emp3_cli1", password: "emp3_cli1", password_confirmation: "emp3_cli1", user_id: cli1.id, status: 1
	(12..17).each do |f|
		Funcionario.create nome: "fun#{f}_emp3_cli1", rg: "fun#{f}_emp3_cli1", matricula: "fun#{f}_emp3_cli1", empresa_id: emp3.id
	end

emp4  = Empresa.create nome: "emp4_cli1", cnpj: "emp4_cli1", email: "emp4_cli1", login: "emp4_cli1", password: "emp4_cli1", password_confirmation: "emp4_cli1", user_id: cli1.id, status: 1
	(18..22).each do |f|
		Funcionario.create nome: "fun#{f}_emp4_cli1", rg: "fun#{f}_emp4_cli1", matricula: "fun#{f}_emp4_cli1", empresa_id: emp4.id
	end

emp5  = Empresa.create nome: "emp5_cli1", cnpj: "emp5_cli1", email: "emp5_cli1", login: "emp5_cli1", password: "emp5_cli1", password_confirmation: "emp5_cli1", user_id: cli1.id, status: 1
	(23..28).each do |f|
		Funcionario.create nome: "fun#{f}_emp5_cli1", rg: "fun#{f}_emp5_cli1", matricula: "fun#{f}_emp5_cli1", empresa_id: emp5.id
	end

emp6  = Empresa.create nome: "emp6_cli1", cnpj: "emp6_cli1", email: "emp6_cli1", login: "emp6_cli1", password: "emp6_cli1", password_confirmation: "emp6_cli1", user_id: cli1.id, status: 1
	(29..34).each do |f|
		Funcionario.create nome: "fun#{f}_emp6_cli1", rg: "fun#{f}_emp6_cli1", matricula: "fun#{f}_emp6_cli1", empresa_id: emp6.id
	end

# Cria empresas para clinica 2
emp7  = Empresa.create nome: "emp7_cli2", cnpj: "emp7_cli2", email: "emp7_cli2", login: "emp7_cli2", password: "emp7_cli2", password_confirmation: "emp7_cli2", user_id: cli2.id, status: 1
	(35..40).each do |f|
		Funcionario.create nome: "fun#{f}_emp7_cli2", rg: "fun#{f}_emp7_cli2", matricula: "fun#{f}_emp7_cli2", empresa_id: emp7.id
	end
	
emp8  = Empresa.create nome: "emp8_cli2", cnpj: "emp8_cli2", email: "emp8_cli2", login: "emp8_cli2", password: "emp8_cli2", password_confirmation: "emp8_cli2", user_id: cli2.id, status: 1
	(41..46).each do |f|
		Funcionario.create nome: "fun#{f}_emp8_cli2", rg: "fun#{f}_emp8_cli2", matricula: "fun#{f}_emp8_cli2", empresa_id: emp8.id
	end

emp9  = Empresa.create nome: "emp9_cli2", cnpj: "emp9_cli2", email: "emp9_cli2", login: "emp9_cli2", password: "emp9_cli2", password_confirmation: "emp9_cli2", user_id: cli2.id, status: 1
	(47..52).each do |f|
		Funcionario.create nome: "fun#{f}_emp9_cli2", rg: "fun#{f}_emp9_cli2", matricula: "fun#{f}_emp9_cli2", empresa_id: emp9.id
	end

emp10 = Empresa.create nome: "emp10_cli2", cnpj: "emp10_cli2", email: "emp10_cli2", login: "emp10_cli2", password: "emp10_cli2", password_confirmation: "emp10_cli2", user_id: cli2.id, status: 1
	(53..58).each do |f|
		Funcionario.create nome: "fun#{f}_emp10_cli2", rg: "fun#{f}_emp10_cli2", matricula: "fun#{f}_emp10_cli2", empresa_id: emp10.id
	end

emp11 = Empresa.create nome: "emp11_cli2", cnpj: "emp11_cli2", email: "emp11_cli2", login: "emp11_cli2", password: "emp11_cli2", password_confirmation: "emp11_cli2", user_id: cli2.id, status: 1
	(59..64).each do |f|
		Funcionario.create nome: "fun#{f}_emp11_cli2", rg: "fun#{f}_emp11_cli2", matricula: "fun#{f}_emp11_cli2", empresa_id: emp11.id
	end

emp12 = Empresa.create nome: "emp12_cli2", cnpj: "emp12_cli2", email: "emp12_cli2", login: "emp12_cli2", password: "emp12_cli2", password_confirmation: "emp12_cli2", user_id: cli2.id, status: 1
	(65..70).each do |f|
		Funcionario.create nome: "fun#{f}_emp12_cli2", rg: "fun#{f}_emp12_cli2", matricula: "fun#{f}_emp12_cli2", empresa_id: emp12.id
	end

# Cria empresas para clinica 3
emp13 = Empresa.create nome: "emp13_cli3", cnpj: "emp13_cli3", email: "emp13_cli3", login: "emp13_cli3", password: "emp13_cli3", password_confirmation: "emp13_cli3", user_id: cli3.id, status: 1
	(71..76).each do |f|
		Funcionario.create nome: "fun#{f}_emp13_cli3", rg: "fun#{f}_emp13_cli3", matricula: "fun#{f}_emp13_cli3", empresa_id: emp13.id
	end
emp14 = Empresa.create nome: "emp14_cli3", cnpj: "emp14_cli3", email: "emp14_cli3", login: "emp14_cli3", password: "emp14_cli3", password_confirmation: "emp14_cli3", user_id: cli3.id, status: 1
	(77..82).each do |f|
		Funcionario.create nome: "fun#{f}_emp14_cli3", rg: "fun#{f}_emp14_cli3", matricula: "fun#{f}_emp14_cli3", empresa_id: emp14.id
	end

emp15 = Empresa.create nome: "emp15_cli3", cnpj: "emp15_cli3", email: "emp15_cli3", login: "emp15_cli3", password: "emp15_cli3", password_confirmation: "emp15_cli3", user_id: cli3.id, status: 1
	(83..88).each do |f|
		Funcionario.create nome: "fun#{f}_emp15_cli3", rg: "fun#{f}_emp15_cli3", matricula: "fun#{f}_emp15_cli3", empresa_id: emp15.id
	end

emp16 = Empresa.create nome: "emp16_cli3", cnpj: "emp16_cli3", email: "emp16_cli3", login: "emp16_cli3", password: "emp16_cli3", password_confirmation: "emp16_cli3", user_id: cli3.id, status: 1
	(89..94).each do |f|
		Funcionario.create nome: "fun#{f}_emp16_cli3", rg: "fun#{f}_emp16_cli3", matricula: "fun#{f}_emp16_cli3", empresa_id: emp16.id
	end

emp17 = Empresa.create nome: "emp17_cli3", cnpj: "emp17_cli3", email: "emp17_cli3", login: "emp17_cli3", password: "emp17_cli3", password_confirmation: "emp16_cli3", user_id: cli3.id, status: 1
	(95..100).each do |f|
		Funcionario.create nome: "fun#{f}_emp17_cli3", rg: "fun#{f}_emp17_cli3", matricula: "fun#{f}_emp17_cli3", empresa_id: emp17.id
	end

emp18 = Empresa.create nome: "emp18_cli3", cnpj: "emp18_cli3", email: "emp18_cli3", login: "emp18_cli3", password: "emp18_cli3", password_confirmation: "emp17_cli3", user_id: cli3.id, status: 1
	(101..106).each do |f|
		Funcionario.create nome: "fun#{f}_emp18_cli3", rg: "fun#{f}_emp18_cli3", matricula: "fun#{f}_emp18_cli3", empresa_id: emp18.id
	end

# Cria empresas para clinica 4
emp19 = Empresa.create nome: "emp19_cli4", cnpj: "emp19_cli4", email: "emp19_cli3", login: "emp19_cli4", password: "emp19_cli4", password_confirmation: "emp19_cli4", user_id: cli4.id, status: 1
	(107..112).each do |f|
		Funcionario.create nome: "fun#{f}_emp19_cli4", rg: "fun#{f}_emp19_cli4", matricula: "fun#{f}_emp19_cli4", empresa_id: emp19.id
	end

emp20 = Empresa.create nome: "emp20_cli4", cnpj: "emp20_cli4", email: "emp20_cli3", login: "emp20_cli4", password: "emp20_cli4", password_confirmation: "emp20_cli4", user_id: cli4.id, status: 1
	(113..118).each do |f|
		Funcionario.create nome: "fun#{f}_emp20_cli4", rg: "fun#{f}_emp20_cli4", matricula: "fun#{f}_emp20_cli4", empresa_id: emp20.id
	end

cat1 = Categoria.create nome: "Outro"
cat2 = Categoria.create nome: "Admissional"
cat3 = Categoria.create nome: "Mudança de Função"
cat4 = Categoria.create nome: "Demissional"



