Rails.application.routes.draw do
  # mount ActionCable.server => "/cable"
  get 'messages/conversations'
  get 'messages/index'
  get 'messages/create'
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resource :profile, only: [:show, :edit, :update]
  resources :matches, only: [:index , :show]

  # resources :invitations, only: [ :new, :create, :show, :index, :destroy ]
  resources :questions, only: [:show ] do
      resources :answers, only: [ :create ]
  end

  get 'conversations', to: 'messages#conversations'
  resources :users, only: [] do
    resources :messages, only: [:index, :create]
  end

  get 'calendar', to: 'calendars#generate', as: 'calendar'

  resources :maps, only: [:index]
end
