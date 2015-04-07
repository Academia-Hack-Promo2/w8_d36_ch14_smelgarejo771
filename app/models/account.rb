class Account < ActiveRecord::Base

	validates :type, inclusion: { :in => (1..3)},  presence: true
	validates :number, presence: true, uniqueness: true, length: { :in => 12..20}
	validates :balance, presence: true, numericality: true


	def create params
		
		sw = params[:number]
		puts sw
		if params[:type].to_i == 1
			sw = ("01050001"+sw.to_s)
		elsif params[:type].to_i == 2
			sw = ("01050002"+sw.to_s)
		elsif params[:type].to_i == 3
			sw = ("01050003"+sw.to_s)
		else
			return {"Error" => "Tipo de cuenta no valido"}
		end
		puts "2"
		puts sw
		aux = Account.where(number: sw).exists?
		
		if aux
			return {"Error" => "la cuenta ya existe"}
		end

		if (params[:number].chomp.to_s).length != 12
			return {"Error" => "La cuenta no cumple con el numero de digitos"}
		else	
			if params[:type].to_i == 1
				self.number = ("01050001"+params[:number].to_s)
				self.client_id = params[:id].to_i
			elsif params[:type].to_i == 2
				self.number = ("01050002"+params[:number].to_s)
				self.client_id = params[:id].to_i
			elsif params[:type].to_i == 3
				self.number = ("01050003"+params[:number].to_s)
				self.client_id = params[:id].to_i
			else
				return {"Error" => "Tipo de cuenta no valido"}
			end	
		end			
	end
end
