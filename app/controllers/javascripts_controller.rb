class JavascriptsController < ApplicationController
	def funcionarios_dinamicos
		@funcionarios = Funcionario.where(empresa_id: params[:empresa_id]).order("nome")
		render json: @funcionarios
	end
end