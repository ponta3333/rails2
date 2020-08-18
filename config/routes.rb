Rails.application.routes.draw do
  root 'home#top'
  get 'home/about' => 'home#about'
  devise_for :users, controllers: {registrations: 'users/registrations', sessions: 'users/sessions'}
  resources :users do
  	resource :relationships, only: [:create, :destroy]
  	get 'follows' => 'relationships#follow', as: 'follows'
  	get 'followers' => 'relationships#follower', as: 'followers'
  end
  resources :books do
  	resources :favorites, only: [:create, :destroy]
  	resources :book_comments, only: [:create, :destroy]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
