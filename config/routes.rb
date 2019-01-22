Rails.application.routes.draw do
  root "tops#index"
  get '/homes/searchmap', to: "homes#searchmap"
  #homes_map_path
  resources :homes do
    collection do
      post :confirm
    end
  end
  resources :tops, only: [:index]
  resources :sessions, only: [:new, :create, :destroy]
  resources :users
  resources :favorites, only: [:index, :create, :destroy]
    #mount LetterOpenerWeb::Engine, at: "/letter_opener"
end
