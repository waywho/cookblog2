Rails.application.routes.draw do

  root "recipes#index"
	#Casein routes
	namespace :casein do
		resources :partner_assets do
      collection do
        post :edit_multiple
        post :update_multiple
        post :import
      end
    end
		resources :offers do
      collection do
        post :edit_multiple
        post :update_multiple
        post :import
      end
     end
		resources :ads do
      collection do
        post :edit_multiple
        post :update_multiple
        post :import
      end
	   end
		resources :photos do
      collection do
        post :edit_multiple
        post :update_multiple
        post :import
      end
    end
		resources :recipes do
      collection do
        post :edit_multiple
        post :update_multiple
        post :import
      end
    end
	end

  resources :recipes, only: [:index, :show] do
    collection do
      get :main_dishes
      get :desserts
      get :articles_tips
      get :deals
    end
  end

  resources :offers, only: [:index]

  post 'versions/:id/revert' => 'versions#revert', :as => 'revert_version'
  get 'recipes/:keyword', :to => 'recipes#index', as: :keyword

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
