Rails.application.routes.draw do
  #ログイン機能,ログアウト機能
  get '/login', to: "sessions#new" ,as:"login"#ログイン画面
  post "/login", to: "sessions#creat",as:"login_creat"
  delete "/logout", to: "sessions#destory", as: "destory"#ログアウト機能
 #ホーム画面 ログイン後の投稿一覧
  root to:"simples#home"
#パスワード再設定機能
  get "/password_resets/new",to: "password_resets#new" ,as:"pass_new"#パスワード再設定画面
  post "/password_resets",to: "password_resets#user_find",as:"user_find"
  get "/password_resets/edit",to: "password_resets#edit", as:"pass_edit"
  patch "	/password_resets",to: "password_resets#update", as:"pass_update"
#user機能
  get '/users/new', to: "users#new", as:"new" #新規登録画面
  get "/renew", to:"users#renew",as:"renew"#再登録
  post "/reupdate",to:"users#reupdate",as:"reupdate"
  post "/users", to: "users#creat",as:"creat"
  get '/users/mypage', to: "users#show",as:"mypage"#プロフィール詳細画面
  get '/users/:name', to: "users#show",as:"user"
  get '/users/:id/edit', to: "users#edit",as:"edit"#プロフィール編集画面
  patch '/users/:id/edit', to: "users#update" ,as:"update"#プロフィール更新画面
  delete '/users/:id', to: "users#destory",as: "delete"#ログアウト
  delete "/resign/:id", to: "users#resign",as:"resign"#ユーザの退会のための論理削除

#投稿機能
  get "/posts/new", to:"posts#new", as:"posts_new"#新規投稿ページ
  get "/posts/:id", to:"posts#show", as:"posts_show"#投稿詳細ページ
  get "/posts/:id/edit", to:"posts#edit",as:"posts_edit"#投稿編集画面
  patch "/posts/:id",to:"posts#update", as:"posts_update"#投稿のアップデート
  post "/posts",to:"posts#creat",as: "posts_creat"
  delete "/posts/:id", to:"posts#destroy" , as: "posts_delete"
#コメント機能
  post "/comments/:id", to:"comments#creat",as:"comment_creat"#コメント
  delete "/comments/:id", to:"comments#destroy" , as: "comment_delete"#コメント削除
#いいね機能
  post "/comment_likes/:comment_id/:user_id", to:"likes#comment_creat" ,as:"like_comment_creat"
  post "/post_likes/:post_id/:user_id", to:"likes#post_creat" ,as:"like_post_creat"
  delete "/likes/:post_id/:user_id",to:"likes#destroy",as:"like_destory"
  delete "/likes/:user_id/:comment_id",to:"likes#comment_like_destroy" ,as:"comment_like_destroy"

  resources :password_resets,     only: [:new, :create, :edit, :update]
  resources :posts,          only: [:create, :destroy]
  resources :relationships,       only: [:create, :destroy]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
