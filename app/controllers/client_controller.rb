class ClientController < ApplicationController
	
	def index
		clients = Client.all
		render json: clients.to_json
	end

	def show
		aux = Client.exists?((params[:id].to_i))
		if aux == true
			todo = Client.find((params[:id].to_i))
			render json: todo.to_json
		else
			render json: {"Error" => "El usuario no existe"}
		end	
	end	

	def create
		aux = (Client.where(credential: (params[:credential].to_i))).exists?
		if aux == true
			render json: {"Error" => "La credencial ya esta registrada"}
		else	
			client = Client.new(client_params)
			client.save
			render json: client.to_json
		end	
	end

	def delete
		aux = Client.exists?((params[:id].to_i))
		if aux == true
			client = Client.find((params[:id].to_i))
			client.delete
			render json: client.to_json
		else
			render json: {"Error" => "El usuario no existe"}
		end	
	end

	def update
		aux = Client.exists?((params[:id]).to_i)
		if aux == true
			client = Client.find((params[:id]).to_i)
			client.update(client_params)
			client.save
			render json: client.to_json
		else
			render json: {"Error" => "El usuario no existe"}
		end
	end

	def account
		aux = Client.exists?((params[:id]).to_i)
		if aux == true	
			client = Client.new
			respuesta = client.new_account(client_account_params)
			render json: respuesta.to_json
		else
			render json: {"Error" => "El usuario no existe"}	
		end	
	end	

	private

	def client_params
		params.permit(:first_name, :last_name, :credential, :addres,:local_phone, :movil_phone)
	end	

	def client_account_params
		params.permit(:type, :number, :balance, :id)
	end
end
