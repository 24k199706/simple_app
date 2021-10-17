Rails.application.routes.draw do
  get '/login', to: "sessions#new" ,as:"login"#ログイン画面
  post "/login", to: "sessions#creat",as:"login_creat"
  delete "/logout", to: "sessions#destory", as: "destory"#ログアウト機能
 
  root to:"simples#home"#ホーム画面 ログイン後の投稿一覧
  
  get "/password_resets/new",to: "password_resets#new" ,as:"pass_new"#パスワード再設定画面
  post "/password_resets",to: "passsword_resets#creat",as:"pass_creat"
  get "/password_resets/<token>/edit",to: "password_resets#edit", as:"pass_edit"
  patch "	/password_resets/<token>",to: "password_resets#update", as:"pass_update"

  get '/users/new', to: "users#new", as:"new" #新規登録画面
  post "/users", to: "users#creat",as:"creat"
  get '/users/index', to: "users#index" ,as:"index"#フォローしているユーザ一覧
  get '/users/mypage', to: "users#show",as:"mypage"#プロフィール詳細画面
  get '/users/:name', to: "users#show",as:"user"
  get '/users/:name/edit', to: "users#edit",as:"edit"#プロフィール編集画面
  patch '/users/:name/edit', to: "users#update" ,as:"update"#プロフィール更新画面
  delete '/users/:id', to: "users#destory",as: "delete"#ログアウト
  delete "/resign/:id", to: "users#resign",as:"resign"#ユーザの退会のための論理削除

  get "/posts/new", to:"posts#new", as:"posts_new"#新規投稿ページ
  get "/posts/:id", to:"posts#show", as:"posts_show"#投稿詳細ページ
  get "/posts/:id/edit", to:"posts#edit",as:"posts_edit"#投稿編集画面
  patch "/posts/:id",to:"posts#update", as:"posts_update"#投稿のアップデート
  post "/posts",to:"posts#creat",as: "posts_creat"
  delete "/posts/:id", to:"posts#destroy" , as: "posts_delete"
  post "/posts/:id", to:"comments#creat",as:"comment_creat"
  resources :password_resets,     only: [:new, :create, :edit, :update]
  resources :posts,          only: [:create, :destroy]
  resources :relationships,       only: [:create, :destroy]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
