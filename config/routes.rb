Rails.application.routes.draw do

  devise_for :users
  resources :restaurants do
  	resources :reviews, except: [:index, :show]

  	collection do
  		get 'search'
  	end
  end
 
  get '/about_us', to: 'pages#about_us'

  get '/contact_us', to: 'pages#contact_us'

	root "restaurants#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
