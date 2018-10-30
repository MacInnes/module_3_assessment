Rails.application.routes.draw do
  root "welcome#index"

  post '/word', to: 'sentences#index'


end
