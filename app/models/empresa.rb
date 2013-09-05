class Empresa < ActiveRecord::Base
  attr_accessible :cnpj, :email, :login, :nome, :password, :password_confirmation, :password_digest, :user_id
  has_secure_password
  belongs_to :user
  has_many :funcionarios
  has_many :exames


	def self.login(login,password)
		find_by_login(login).try(:authenticate, password)
	end
end
