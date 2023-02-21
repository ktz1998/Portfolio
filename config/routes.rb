Rails.application.routes.draw do
  #管理者用
  devise_for :admins, skip: [:registrations, :passwords] ,controllers: {
    sessions: "admin/sessions"
  }
  namespace :admin do
    resources :items, only: [:index, :show, :destroy]
    resources :tags, only: [:index, :create, :edit, :update, :destroy]
    get "/top" => "homes#top"
    patch "/top/withdraw/:user_id" => "homes#withdraw"
  end

  #顧客用
  devise_for :users, skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }
  devise_scope :user do
    post 'users/guest_sign_in', to: 'public/sessions#new_guest'
  end
  scope module: :public do
    root "homes#top"
    get '/about' => 'homes#about'
    resources :users, only: [:show, :update]
    resources :items do
      resources :comments, only: [:create, :destroy]
      
    end
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
