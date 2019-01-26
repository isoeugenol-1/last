Rails.application.routes.draw do
  root "tops#index"
  get '/homes/sendmail', to: "homes#sendmail"
  get '/homes/send_mail', to: "homes#send_mail"
  get '/homes/sendqes', to: "homes#sendqes"
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
