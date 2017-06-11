Rails.application.routes.draw do

  root to: 'static_pages#home'

  resources :users, only:[:new,:create]

  get '/signin' => 'sessions#new'
  post '/signin' => 'sessions#create'
  delete '/signout' => 'sessions#destroy'


  resources :children do
    resources :skills, only: [:index, :new, :create] do
      collection do
        get :recent
      end
    end
  end


  get 'auth/facebook/callback', to: 'sessions#create'
  get 'auth/failure', to: redirect('/')


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
