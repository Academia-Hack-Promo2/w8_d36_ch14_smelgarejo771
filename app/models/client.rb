class Client < ActiveRecord::Base
	# def check_balance (params)
	# 	aux = (Client.where(credential: (params[:credential].to_i))).exists?
	# 	if aux == true
	# 		client = Client.where(credential: params[:credential].to_i)
	# 		return client
	# 	else	
	# 		 return {"Error" => "La credencial ya esta registrada"}
	# 	end	
	# end	
end
