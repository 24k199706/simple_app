Rails.application.routes.draw do
  get '/login', to:"sessions#new" ,as:"login"
  post "/login", to:"sessions#creat",as:"login_creat"
  root 'simples#home',as:"simple"#ホーム画面
  get '/users/new', to:"users#new", as:"new" #新規登録画面
  post "/users", to:"users#creat",as:"creat"
  get '/users/index', to:"users#index" ,as:"index"
  get '/users/:id', to:"users#show",as:"user"
  get '/users/edit', to:"users#edit",as:"edit"
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
