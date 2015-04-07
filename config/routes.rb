Rails.application.routes.draw do
  get "/clients" => "client#show" 
  get "/clients/:id" => "client#showspecifit"
  post "/clients" => "client#create"
  put "/clients/:id" => "client#update"
  delete "/clients/:id" => "client#delete"
  # get "/clients/balance/:credential" => "client#balance"

   get "/accounts" => "account#show" 
   get "/accounts/:id" => "account#showspecifit"
   delete "/accounts/:id" => "account#delete"
end
