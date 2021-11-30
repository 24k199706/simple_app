Rails.application.routes.draw do
  #ログイン機能,ログアウト機能
  get '/login', to: "sessions#new" ,as:"login"#ログイン画面
  post "/login", to: "sessions#create",as:"login_creat"
  delete "/logout", to: "sessions#destroy", as: "destroy"#ログアウト機能
 #ホーム画面 ログイン後の投稿一覧
 root to:"simples#home"
#パスワード再設定機能
  get "/password_resets/new",to: "password_resets#new" ,as:"pass_new"#パスワード再設定画面
  post "/password_resets",to: "password_resets#user_find",as:"user_find"
  get '/password_resets/edit/:user_id',to: "password_resets#edit", as:"pass_edit"
  patch '/password_resets/:user_id',to: "password_resets#update", as:"pass_update"

#お問い合わせページ
  get "/faq", to: "faqs#question", as:"faq"
#user機能
  get '/users/new', to: "users#new", as:"new" #新規登録画面
  get "/renew", to:"users#renew",as:"renew"#再登録
  post "/reupdate",to:"users#reupdate",as:"reupdate"
  post "/users", to: "users#create",as:"create"
  get '/users/mypage', to: "users#show",as:"mypage"#プロフィール詳細画面
  get '/users/:name', to: "users#show",as:"user"
  get '/users/:id/edit', to: "users#edit",as:"edit"#プロフィール編集画面
  patch '/users/:id/edit', to: "users#update" ,as:"update"#プロフィール更新画面
  delete '/users/:id', to: "users#destroy",as: "delete"#ログアウト
  delete "/resign/:id", to: "users#resign",as:"resign"#ユーザの退会のための論理削除

#投稿機能
  get "/posts/new", to:"posts#new", as:"posts_new"#新規投稿ページ
  post "/posts",to:"posts#create",as: "posts_create"
  get "/posts/:id", to:"posts#show", as:"posts_show"#投稿詳細ページ
  patch "/posts/:id",to:"posts#update", as:"posts_update"#投稿のアップデート
  delete "/posts/:id", to:"posts#destroy" , as: "posts_delete"
#コメント機能
  post "/comments/:id", to:"comments#create",as:"comment_create"#コメント
  delete "/comments/:id", to:"comments#destroy" , as: "comment_delete"#コメント削除

#タグ機能
  get '/post/hashtag/:name', to: "posts#hashtag" ,as:"hashtag"

#いいね機能
  post "/post_likes/:post_id/:user_id", to:"likes#post_create" ,as:"like_post_create"
  delete "/post_likes/:post_id/:user_id",to:"likes#destroy",as:"like_destroy"
  post "/comment_likes/:comment_id/:user_id", to:"likes#comment_like_create" ,as:"like_comment_create"
  delete "/comment_likes/:user_id/:comment_id",to:"likes#comment_like_destroy" ,as:"comment_like_destroy"

  resources :password_resets,     only: [:new, :create, :edit, :update]
  resources :posts,          only: [:create, :destroy]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
