Rails.application.routes.draw do

  root to: 'static_pages#home'

  resources :users, only:[:new,:create]

  get '/signin' => 'sessions#new'
  post '/signin' => 'sessions#create'
  delete '/signout' => 'sessions#destroy'


  resources :children, only:[:show, :update] do
    member do
      get :recent_skills
    end
    resources :skills, only: [:index, :new, :create]
  end


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
