Rails.application.routes.draw do
# エンドユーザー用
# URL /users/sign_in ...
devise_for :users,skip: [:passwords], controllers: {
registrations: "public/registrations",
sessions: 'public/sessions'
}

devise_scope :user do
  post 'users/guest_sign_in', to: 'users/sessions#guest_sign_in'
end

#エンドユーザー側ルーティング
scope module: :public do

  get 'matchings/seach' => 'matchings#seach'

  resources :matchings, only: [:index]
  resources :reactions, only: [:create]
  resources :chat_rooms, only: [:create, :show]
  resources :notifications, only: [:index]
  resources :activity_points, only: [:new, :create, :show, :edit, :update, :destroy]

  get 'users/info' => 'users#info'
  get 'users/matching' => 'users#matching'
  get 'users/unsubscribe' => 'users#unsubscribe'
  patch 'users/withdraw' => 'users#withdraw'
  resources "users", path: 'users/my_page', only: [:show, :edit, :update]

  root to: "homes#top"
  get "about" => "homes#about", as: "about"

end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
