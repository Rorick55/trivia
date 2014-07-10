Rails.application.routes.draw do

  devise_for :users
  root to: "trivia_facts#index"

  resources :trivia_facts, only: [:index, :show, :create, :new]

  resources :trivia_facts do
    resources :favorites, only: [:new, :create]
    resources :votes, only: [:edit, :update, :create, :new]
  end

  resources :user, only: :show

  namespace :admin do
    resources :trivia_facts, except: [:new, :create]
  end

  get "admin/trivia_facts/:id/activate" => "admin/trivia_facts#activate", :as => "admin_active_trivia_fact"
end
