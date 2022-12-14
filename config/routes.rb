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

#ゲストログイン用
devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#guest_sign_in'
end

 #user側のルーティング設定
 scope module: :user do
   root to: "homes#top"
   get '/about' => 'homes#about', as: 'about'
   get "search" => "searches#search"
   resources :films do
     resource :favorites, only: [:create, :destroy]
     resources :film_comments, only: [:create, :destroy]
   end

   get '/unsubscribe' => 'users#unsubscribe', as: 'unsubscribe'
   patch '/withdraw' => 'users#withdraw', as: 'withdraw'
   resources :users, only: [:index, :show, :edit, :update]

   get "/films/genre_search/:id" => "films#genre_search",as: 'films_genre_search'
 end

 #管理者側のルーティング設定
 namespace :admin do
   root to: "homes#top"
   resources :genres, only: [:index, :create, :edit, :update, :destroy]
   resources :users, only: [:index, :show, :edit, :update]
   resources :films, only: [:index, :show, :destroy] do
     resources :film_comments, only: [:destroy]
   end
 end


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
