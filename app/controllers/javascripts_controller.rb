class JavascriptsController < ApplicationController
	def funcionarios_dinamicos
		@funcionarios = Funcionario.find_by_sql("select * from funcionarios WHERE (nome LIKE '%#{params[:nome]}%' or rg LIKE '%#{params[:nome]}%') AND empresa_id = #{params[:empresa_id]} ")
		render json: @funcionarios
	end

	def valida_funcionario_rg
		@funcionario = Funcionario.find(:rg => params[:rg])
		render json: @funcionario
	end

	def busca_funcionarios
		#@funcionario = Funcionario.find(:rg => params[])
	end
end