class AccountController < ApplicationController

	def index
		accounts = Account.all
		render json: accounts.to_json
	end

	def show
		aux = (Account.where(id: (params[:id].to_s))).exists?
		if aux == true
			account = (Account.where(id: (params[:id].to_s)))
			render json: account.to_json
		else
			render json: {"Error" => "El usuario no existe"}
		end	
	end	

	def delete
			aux = Account.exists?((params[:id].to_i))
		if aux == true
			account = Account.find((params[:id].to_i))
			account.delete
			render json: account.to_json
		else
			render json: {"Error" => "La cuenta no existe"}
		end
	end	
end
