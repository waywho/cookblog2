Rails.application.routes.draw do
  
  match "/admin" => redirect("/casein"), :via => :get
  
  namespace :casein do
  
    resources :admin_users do
      member do
        patch :update_password, :reset_password
      end
    end
    
    resource :admin_user_session, :only => [:new, :create, :destroy]
    resource :password_reset, :only => [:create, :edit, :update]
        
    match "/blank" => "casein#blank", :via => :get
    root :to => "casein#index"
  end
  
end
