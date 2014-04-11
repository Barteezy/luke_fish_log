App::Application.routes.draw do

  resources :profiles

  resources :fish

  root "main#index"

  get "/login" => "main#login_get"

  get "/sign_up" => "main#sign_up_get"

  post "/sign_up" => "main#sign_up_post"

  get "/fish_id" => "main#fish_id_get"

  get "/about" => "main#about"

  get "/logout" => "main#logout"

  get "/logged_out" => "main#logged_out_get"

  post "/login" => "main#login_post"


end
