Homes::Application.routes.draw do
  
  devise_for :users, :path => '/admin', :controllers => { :registrations => "admin/users/registrations" } do
    get 'admin/sign_out' => 'devise/sessions#destroy', :as => :destroy_admin_session               
    
  end
  
  
  namespace :admin do
    
    root :to => "admin/homes#index"
    
    match 'setting_shops/log/:id', :controller=>"setting_shops", :action=>"log"
    resources :setting_shops
  
  
    match 'owners/active/:id', :controller=>"owners", :action=>"active"
    match 'owners/inactive/:id', :controller=>"owners", :action=>"inactive"
    match 'owners/log/:id', :controller=>"owners", :action=>"log"
    match 'homes/get_owner' => 'homes#get_owner', :as => :homes_get_owner
    resources :owners
  
    
    match 'homes/active/:id', :controller=>"homes", :action=>"active"
    match 'homes/inactive/:id', :controller=>"homes", :action=>"inactive"
    match 'homes/log/:id', :controller=>"homes", :action=>"log"
    resources :homes
  
    resources :settings
    
    match 'module_extensions/active/:id', :controller=>"module_extensions", :action=>"active"
    match 'module_extensions/inactive/:id', :controller=>"module_extensions", :action=>"inactive"
    match 'module_extensions/set_config/:id', :controller=>"module_extensions", :action=>"set_config"
    match 'module_extensions/log/:id', :controller=>"module_extensions", :action=>"log"
    resources :module_extensions
    
    match 'banners/log/:id', :controller=>"banners", :action=>"log"
    resources :banners
    
    match 'highlights/log/:id', :controller=>"highlights", :action=>"log"
    resources :highlights
    
    match 'affiliates/active/:id', :controller=>"affiliates", :action=>"active"
    match 'affiliates/inactive/:id', :controller=>"affiliates", :action=>"inactive"
    match 'affiliates/log/:id', :controller=>"affiliates", :action=>"log"
    resources :affiliates
    
    
    
    
    match 'users/active/:id', :controller=>"users", :action=>"active"
    match 'users/inactive/:id', :controller=>"users", :action=>"inactive"
    match 'users/log/:id', :controller=>"users", :action=>"log"
    resources :users
    
    
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
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
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
  root :to => "shops#index"
  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
