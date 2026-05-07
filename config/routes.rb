Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # API routes
  namespace :api do
    namespace :v1 do
      resources :columns, only: [:index]
      resources :cards, only: [:index, :create, :update, :destroy]
      resources :board_events, only: [:index]
      post '/cards/:id/move', to: 'cards#move'
      post '/cards/:id/reorder', to: 'cards#reorder'
      get '/board/state', to: 'board#state'
      get '/board/state_at', to: 'board#state_at'
      get '/board/events', to: 'board#events'
    end
  end
end
