App::Application.routes.draw do

  resources :fish

get "/" => "main#root"

get "/login" => "main#login_get"

get "/sign_up" => "main#sign_up_get"

get "/create_profile/:username" => "main#create_profile_get"

post "create_profile/:username" => "main#create_profile_post"

get "/edit_profile/:username" => "main#edit_profile_get"

get "/add_fish" => "fish#new"

post "/add_fish" => "fish#new_post"

get "/bragging_board" => "main#bragging_board_get"

post "/login" => "main#login_post"

post "/sign_up" => "main#sign_up_post"

get "/profile/:id" => "main#profile_get"

get "/about" => "main#about_get"

post "/profile/:username" => "main#profile_post"

get "/fish_id" => "main#fish_id_get"

get "/delete_profile/:username" => "main#delete_profile_get"
  
post "/delete_profile/:username" => "main#delete_profile_post"

get "/logout" => "main#logout_get"

get "/logged_out" => "main#logged_out_get"

get "/fish_profile/:name" => "main#fish_profile_get"

post "/edit_profile/:username" => "main#edit_profile_post"

patch "/edit_profile/:username" => "main#edit_profile_post"
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end
  
  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
