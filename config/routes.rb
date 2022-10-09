Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'top' => 'homes#top'

  get 'books/new'
  get 'top' => 'homes#top'
  post 'books' => 'books#create'
  get 'books' => 'books#index'

  get 'books/new'
  get 'books/index'
  get 'books/show'
  get 'books/edit'
  get 'homes/top'
  devise_for :users
  root to: 'homes#top'

  post 'books' => 'books#create'

  resources :post_images, only: [:new, :create, :index, :show, :destroy]

  resources :users, only: [:show, :edit, :update]

end
