class JavascriptsController < ApplicationController
	def funcionarios_dinamicos
		@funcionarios = Funcionario.where(empresa_id: params[:empresa_id]).order("nome")
		render json: @funcionarios
	end

	def valida_funcionario_rg
		@funcionario = Funcionario.find(:rg => params[:rg])
		render json: @funcionario
	end
end