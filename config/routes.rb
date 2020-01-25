Rails.application.routes.draw do
  
	root 'tribe_members#index'
  
  resources :tribe_members, only: [:index, :new, :create]

end
