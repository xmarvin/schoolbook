Schoolbook::Application.routes.draw do
  devise_for :users do
    get 'users/sign_out', :to => 'devise/sessions#destroy'
  end

  mount Rack::GridFS::Endpoint.new(:db => Mongoid.database, :lookup => :path), :at => "gridfs"

  root :to => "books#index"

  devise_for :users
  resources :exams
  resources :books do
     get :final_test, :to => "exams#final_test"
    resources :dict_items
    resources :chapters do
      resources :exams do
        collection do
         get :test
         get :final_test
        end
      end
    end
  end

  namespace :superadmin do
    root :to => "users#index"
    resources :users
  end

  namespace :admin do
    root :to => "books#index"


    resources :books do

      resources :images
      resources :dict_items
      resources :exams  do
        member do
         post :unlock
        end
      end

      resources :chapters do

        collection do
          post :reposition
        end

        resources :option_tests
        resources :text_tests

      end
    end
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

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end
