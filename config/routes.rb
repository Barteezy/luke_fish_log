App::Application.routes.draw do

  resources :profiles

  resources :fish

  post "profiles/:id" => "fish#follow_post"

  get "/recent" => "fish#recent"

  get "/user/:name" => "fish#user_pics", as: "user_pics"

  root "main#index"

  get "/login" => "main#login_get"

  get "/sign_up" => "main#sign_up_get"

  post "/sign_up" => "main#sign_up_post"

  get "/fish_id" => "main#fish_id_get", as: "fish_id"

  get "/about" => "main#about"

  get "/logout" => "main#logout"

  get "/logged_out" => "main#logged_out_get"

  post "/login" => "main#login_post"

  get "/fish_profile/:fish" => "main#fish_profile"

  get "/verify_email/:user_id/:token" => "main#verify_email",
    as: "verify_email"

  post "/resend_verification_email" => "users#resend_verification_email",
    as: "resend_verification_email"


end
