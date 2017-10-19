Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # This is a SINGULAR resource. You will not create an index route or an id route
  resource :users, only: %i(create new)
  resource :sessions, only: %i(create new destroy)
  
  resources :products do
    resources :reviews, except: [:index, :new, :show]
  end

  get "pages/:page" => "pages#show"
  root "pages#show", page: "landing_page"

end
