class AccountController < ApplicationController

	def show
		accounts = Account.all
		render json: accounts.to_json
	end

	def showspecifit
		aux = (Account.where(number: (params[:number].to_s))).exists?
		if aux == true
			account = (Account.where(number: (params[:number].to_s)))
			render json: account.to_json
		else
			render json: {"Error" => "El usuario no existe"}
		end	
	end	

	def create
		aux = (Account.where(number: (params[:number].to_s))).exists?
		if aux == true
			render json: {"Error" => "El numero de cuenta ya existe"}
		else
			account = Account.new(params)	
			respuesta = account.create(params)
			render json: respuesta.to_json 
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
