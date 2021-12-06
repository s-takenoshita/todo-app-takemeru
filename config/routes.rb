Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root to: "boards#index"

  # resources :boards, only: [:show, :new, :create, :edit]
  resources :boards do
    resources :tasks, only: [:show, :new, :create, :update]

  end

  resource :profile, onry: [:show, :edit, :update]

  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
end
