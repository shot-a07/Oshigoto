Rails.application.routes.draw do
  devise_for :users
  root to: 'homes#top'
  get 'home/about' => 'homes#about'
  post '/post_images', to:'post_images#create', as:'images_create'
  resources :post_images, only: [:new, :index, :show, :edit, :update, :destroy] do
    resources :post_comments, only: [:create, :destroy]

    resource :favorites, only: [:create, :destroy]  #いいね機能
  end

  post '/guest', to: 'guest_sessions#guest_login'  #ゲストログイン

  resources :users, only: [:show, :edit, :update] do

    resource :relationships, only: [:create, :destroy] # follow関連
  get 'followings' => 'relationships#followings', as: 'followings'
  get 'followers' => 'relationships#followers', as: 'followers'
  end


  get 'search' => 'searches#search' # 検索機能


  get 'chat/:id' => 'chats#show', as: 'chat' #チャット機能
  resources :chats, only: [:create]

  end
