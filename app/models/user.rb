class User < ActiveRecord::Base
  attr_accessible :email, :login, :nome, :password, :password_confirmation, :password_digest, :tipo
  has_secure_password
  has_many :empresas

	def self.login(login,password)
		find_by_login(login).try(:authenticate, password)
	end

end
