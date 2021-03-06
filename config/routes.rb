Scaffold::Application.routes.draw do
 
  resources :widgets

  devise_for :users, path: "auth", path_names: { sign_in: 'login', sign_out: 'logout', password: 'secret', confirmation: 'verification', unlock: 'unblock', registration: 'register', sign_up: 'cmon_let_me_in' }, :controllers => {:registrations => 'registrations'}
  
  mount RailsAdmin::Engine => '/admin', :as => 'rails_admin'
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"

  root 'static#index'

  #resources :mods, :path => 'modules', :param => 'name' do 
  #  resources :courses, :path => false, :param => 'name'
  #end

  resources :mods, :path => 'modules', :param => 'slug', :format => false do
    resources :units, :param => 'slug'
  end

  resources :courses, :param => 'slug'

  get 'courses/:course/:lesson/:exercice' => 'exercices#show', :as => 'long_exercice'

  post 'courses/:course/:lesson/:exercice' => 'exercices#show'

  get '/account' => 'accounts#account'

  post '/code_save' => 'exercices#save'

  post '/check_code' => 'exercices#check'

  get '/fill_editor' => 'exercices#fill'


  #resources :mods, :path => 'modules', :param => 'name'

  #get 'modules' => 'mods#index'

  #get 'modules/:name' => 'mods#show', :as => 'mod'

  #get 'modules/:module/:course' => 'courses#show', :as => 'course'

  #get 'modules/wawjdid' => 'mods#new'

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
