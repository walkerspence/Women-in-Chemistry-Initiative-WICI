Rails.application.routes.draw do
  resources :events do
    resources :guests, only: [:new, :create, :destroy]
  end

  devise_for :volunteers
  devise_for :admins
  resources :about, only: [:index]
  resources :donations, only: [:index, :new, :create]

  get 'past-events', to: 'events#past_events', as: 'past_events'
  root 'home#home'

  mount JasmineRails::Engine => '/specs' if defined?(JasmineRails)
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
