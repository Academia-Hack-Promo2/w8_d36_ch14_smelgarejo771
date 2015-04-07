class Account < ActiveRecord::Base

	def create params
		if (params[:number].to_s).length != 12
			{"Error" => "La cuenta no cumple con el numero de digitos"}
		else	
			if params[:type].to_i == 1
				account = Account.new(account_params)
				account.number == "01050001"+params[:number].to_s
				render json: account.to_json
			elsif params[:type].to_i == 2
				account = Account.new(account_params)
				account.number == "01050002"+params[:number].to_s
				render json: account.to_json
			elsif params[:type].to_i == 3
				account = Account.new(account_params)
				account.number == "01050003"+params[:number].to_s
				render json: account.to_json
			else
				render json: {"Error" => "Tipo de cuenta no valido"}
			end	
		end			
	end

	private

	def account_params
		params.permit()
	end	

end
