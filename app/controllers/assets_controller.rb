#encoding: utf-8
class AssetsController < ApplicationController
	def download
		require 'zip'
		@arquivos = params[:arquivos]
		@assets = Asset.where(:id => @arquivos)

#		zip = Zip::File.open(zipfile_name, Zip::File::CREATE)
#		@assets.each do |a|
			#puts "ID #{a.id} | Consulta #{a.consulta_id} | URL #{a.asset.url} | PAth #{a.asset.path}".to_str
			#puts "ID #{a.id} | Consulta #{a.consulta_id} | Empresa #{a.consulta.empresa.nome}".to_str

			#zip.add(a.asset.url, a.consulta.empresa.nome + '/' + a.asset.name)
#		end

		
		if session[:user]
			@nome = User.find(session[:user_id])
		else
			@nome = Empresa.find(session[:empresa_id])
		end



		Zip::File.open("public/zip/#{@nome.nome}-#{Time.now.strftime('%H%M%S%d%m%Y')}.zip", Zip::File::CREATE) do |zipfile|
		  @assets.each do |f|
		    # Two arguments:
		    # - The name of the file as it will appear in the archive
		    # - The original file, including the path to find it
		    zipfile.add(f.asset_file_name, f.asset.path)
		  end
		end






		
		
		  
		






	end
end