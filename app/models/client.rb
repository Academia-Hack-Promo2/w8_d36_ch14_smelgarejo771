class Client < ActiveRecord::Base

	validates :credential, uniqueness: true, presence: true, numericality: true, length: {maximum: 9}
	validates :first_name, presence: true
	validates :last_name, presence: true
	validates :addres, presence: true
	validates :local_phone, presence: true

	def new_account (params)
		client = Client.where(id: params[:id].to_i)
		account = Account.new
		account.type = params[:type].to_i
		respuesta = account.create(params)
		account.balance = params[:balance].to_s
		
		if account.valid?
			account.save
			return account
		else
			return respuesta
		end	

	end	
end
