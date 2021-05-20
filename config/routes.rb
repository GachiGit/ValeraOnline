# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users

  root 'welcome#index'

  get 'game' => 'game#index'
  get 'rules' => 'game#rules'
  post 'new_game' => 'game#new_game'
  post 'go_job' => 'game#go_job'
  post 'rest' => 'game#rest'
  post 'drink_with_marginals' => 'game#drink_with_marginals'
  post 'watch_serial' => 'game#watch_serial'
  post 'sing' => 'game#sing'
  post 'sleep' => 'game#sleep'

  post 'load_game' => 'slots#load_game'

  resources :users
  resources :slots
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
