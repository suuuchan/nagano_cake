Rails.application.routes.draw do
  # devise_for :customers
  # devise_for :admins
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :admin do
    resources :items,except: [:destroy]
    resources :genres, except: [:new, :show, :destroy]
    resources :customers, except: [:create, :new, :destroy]
    resources :orders, only: [:show, :update]
    resources :orders_details, only: [:update]
  end
  
  scope module: :public do
    resources :items, only: [:index, :show]
    resources :cart_items, only: [:index, :update, :create]
    resources :orders, only: [:new, :create, :index, :show]
    resources :addresses, except: [:show]
  end
  
    root :to => "public/homes#top"
    get "/admin" => "admin/homes#top"
    get "/about" => "public/homes#about"
    get "/customers/unsubscribe" => "public/customers#unsubscribe"
    patch "/customers/withdraw" => "public/customers#withdraw"
    delete "/cart_items/:id" => "public/cart_items#destroy"
    delete "/cart_items" => "public/cart_items#destroy_all"
    post "/orders/confirm" => "public/orders#confirm"
    get "orders/thanks" => "public/orders#thanks"
    get "/customers" => "public/customers#show"
    get "customers/edit" => "public/customers#edit"
    patch "customers/edit" => "public/customers#update"
    # post "admin/items/:id" => "admin/items#create"
    # patch "admin/genres" => "admin/genres#update"
    # put "admin/genres" => "admin/genres#update"

  devise_for :admin, controllers: {
      sessions: 'admin/sessions'
    }
    
    
  devise_for :customers, controllers: {
      sessions: 'public/sessions',
      registrations: 'public/registrations'
    } 

end