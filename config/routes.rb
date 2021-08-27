Rails.application.routes.draw do
  root 'simples#home',as:"simple"#ホーム画面
  get 'users/index', to:"users#index"
  get 'users/show', to:"users#show"
  get 'users/edit', to:"users#index"
  get 'users/new', to:"users#new", as:"new" #新規登録画面
  post "users", to:"users#creat",as:"creat"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
