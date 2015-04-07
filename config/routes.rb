Rails.application.routes.draw do
  get "/clients" => "client#index" 
  get "/clients/:id" => "client#show"
  post "/clients" => "client#create"
  put "/clients/:id" => "client#update"
  delete "/clients/:id" => "client#delete"
  post "/clients/create_acount/:id" => "client#account"

   get "/accounts" => "account#index" 
   get "/accounts/:id" => "account#show"
   delete "/accounts/:id" => "account#delete"
end
