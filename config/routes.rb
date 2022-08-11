Rails.application.routes.draw do
# user用
# URL /customers/sign_in ...
devise_for :users,skip: [:passwords], controllers: {
  registrations: "user/registrations",
  sessions: 'user/sessions'
}

# 管理者用
# URL /admin/sign_in ...
devise_for :admin,skip: [:registrations, :passwords], controllers: {
  sessions: "admin/sessions"
}

 #user側のルーティング設定
 scope module: :user do
   root to: "homes#top"
   get '/about' => 'homes#about', as: 'about'
   resources :films do
     resource :favorites, only: [:create, :destroy]
     resources :film_comments, only: [:create, :destroy]
   end

   get '/unsubscribe' => 'users#unsubscribe', as: 'unsubscribe'
   patch '/withdraw' => 'users#withdraw', as: 'withdraw'
   resources :users, only: [:index, :show, :edit, :update]
 end

 #管理者側のルーティング設定
 namespace :admin do
   root to: "homes#top"
   resources :genres, only: [:index, :create, :edit, :update, :destroy]
   resources :users, only: [:index, :show, :edit, :update]
 end


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
