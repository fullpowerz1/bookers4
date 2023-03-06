Rails.application.routes.draw do
  root to: 'homes#top'
  devise_for :users

  # 投稿のルーティング
  resources :books, only: [:index,:show,:edit,:create]

  # 会員のルーティング
  resources :users, only: [:index,:show,:edit]

  get 'homes/about' => 'homes#about',as: 'about'
end