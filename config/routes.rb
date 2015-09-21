Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  resources :vote_details
  resources :ip_lists
  resources :categories
  resources :categories
  resources :questions
  resources :comments
  devise_for :users
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".
  root 'home#index'

  post 'updateVote' => 'vote_details#create', as: :makevote
  get 'users' => 'home#index'



  namespace :api do
    get 'questions' => 'questions#index'
    get 'questions/:id' => 'questions#show'
    post 'questions' => 'questions#create', as: :api_question_create
    # get 'questions/:id' => 
    post 'makeComment' => 'comments#create'
    post 'sign_in'  => 'sessions#create', as: :api_sign_in
    delete 'sign_out' => 'sessions#destroy', as: :api_sign_out
    post 'register' => 'users#create', as: :api_user_create
    post 'updateVote' => 'vote_details#create', as: :makevote
  end
  # post 'updateComment' => 'comments#create', as: :makecomment
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
