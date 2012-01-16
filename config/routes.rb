Rubysport::Application.routes.draw do
    #get "sign_up" => "players#new", :as => "sign_up"
   #root :controller => 'home#' ,:action =>"index"
    root :to => "home#index"
    resources :invitations
    resources :locations

     resources :players
  #get "invitations/new"

#resources :photos do
#  get 'preview', :on => :member
#end
  get "login" => "sessions#new", :as => "login"
    #  root :to => "sessions#new"
      resources :sessions

get "signup/:invitation_token" => "players#new", :as => "sign_up"
  #, :controller => "players", :action => "new" , :as =>

   
  
  
  



  get "log_out" => "sessions#destroy", :as => "log_out"


#resources :team_invites

  #get 'team_invites/register'










  match 'map' => "locations#map"
  get "members/create"
  get "players/destroy"

resources :sessions



    resources :events do
  resources :locations
end
    resources :teams do
  resources :players

end

  resources :teams do
  resources :events do
    resources :locations
  end
end



     resources :teams do
       resources :members, :players
       resource :events, :locations
     end
  resources :members do
  resources :players
  resources :team_invites
end



  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
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

  # Sample resource route with sub-resources:
  

    # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end


  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end
