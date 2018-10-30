Rails.application.routes.draw do
  root "welcome#index"

  post '/word', to: 'words#index'

  
end
