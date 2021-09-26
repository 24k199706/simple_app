Rails.application.routes.draw do
  get '/login', to: "sessions#new" ,as:"login"#ログイン画面
  post "/login", to: "sessions#creat",as:"login_creat"
  delete "/logout", to: "sessions#destory", as: "destory"#ログアウト機能

  root to:"simples#home"#ホーム画面　ログイン後の投稿一覧
  get "/password_resets/new",to: "password_resets#new" ,as:"pass_new"#パスワード再設定画面
  post "/password_resets",to: "passsword_resets#creat",as:"pass_creat"
  get "/password_resets/<token>/edit",to: "password_resets#edit", as:"pass_edit"
  patch "	/password_resets/<token>",to: "password_resets#update", as:"pass_update"

  get '/users/new', to: "users#new", as:"new" #新規登録画面
  post "/users", to: "users#creat",as:"creat"
  get '/users/index', to: "users#index" ,as:"index"
  get '/users/:id', to: "users#show",as:"user"#プロフィール詳細画面
  get '/users/:id/edit', to: "users#edit",as:"edit"#プロフィール編集画面
  patch '/users/:id/edit', to: "users#update" ,as:"update"#プロフィール更新画面

  delete '/users/:id', to: "users#destory",as: "delete"
  get "/posts/new", to:"posts#new", as:"posts_new"
  get "/posts/:id", to:"posts#show", as:"posts_show"#投稿詳細ページ
  get "/posts/:id/edit", to:"posts#edit",as:"posts_edit"#投稿編集画面
  post "/posts",to:"posts#creat",as: "posts_creat"
  delete "/posts/:id", to:"posts#destory" , as: "posts_delete"
  resources :users
  resources :password_resets,     only: [:new, :create, :edit, :update]
  resources :posts,          only: [:create, :destroy]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
