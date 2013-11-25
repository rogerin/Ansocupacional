class Empresa < ActiveRecord::Base
  self.primary_key = :id
 
  attr_accessible :id, :nome, :cnpj, :email, :login, :password, :password_confirmation, :password_digest, :user_id, :status

  belongs_to :user
  has_many :funcionarios, dependent: :destroy
  has_many :consultas, dependent: :destroy
  has_many :log_empresas, dependent: :destroy


	
  def self.login(login,password)
    """find_by_login(login).try(:authenticate, password)"""
    find_by_login_and_password_digest(login, password) 
  end
end
