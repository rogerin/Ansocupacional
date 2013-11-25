#encoding: utf-8
class AssetsController < ApplicationController
	def download
		require 'zip'
		require 'extend_string'
		
		@arquivos = params[:arquivos]
		@assets = Asset.where(:id => @arquivos)
		
		if session[:user]
			@nome = User.find(session[:user_id])
		else
			@nome = Empresa.find(session[:empresa_id])
		end
		nome_arquivo = "zip/#{@nome.nome}-#{Time.now.strftime('%H%M%S%d%m%Y')}.zip".removeaccents
		Zip::File.open("public/#{nome_arquivo}".removeaccents, Zip::File::CREATE) do |zipfile|
		  @assets.each do |f|
		    # Two arguments:
		    # - The name of the file as it will appear in the archive
		    # - The original file, including the path to find it
		    zipfile.add(f.asset_file_name.removeaccents, f.asset.path.removeaccents)
		  end
		end
		File.chmod(0644, "public/"+nome_arquivo)

		redirect_to root_url + nome_arquivo
	end
end