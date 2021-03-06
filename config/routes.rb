Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  namespace :api do
    namespace :v1 do
      namespace :merchants do
        controller :search do
          get '/find' => :show
          get '/find_all' => :index
        end
          get '/random' => "random#show"
          get '/:id/items' => "items#index"
          get '/:id/invoices' => "invoices#index"
          get '/most_items' => "most_items#index"
          get '/most_revenue' => "most_revenue#index"
          get '/:id/revenue' => "revenue#show"
          get '/:id/favorite_customer' => "favorite_customer#show"
      end
      resources :merchants, only: [:show, :index]

      namespace :transactions do
        controller :search do
          get '/find' => :show
          get '/find_all' => :index
        end
          get '/random' => "random#show"
          get '/:id/invoice' => "invoices#show"
      end
      resources :transactions, only: [:show, :index]

      namespace :customers do
        controller :search do
          get '/find' => :show
          get '/find_all' => :index
        end
          get '/random' => "random#show"
          get '/:id/transactions' => "transactions#index"
          get '/:id/invoices' => "invoices#index"
          get '/:id/favorite_merchant' => "favorite_merchant#show"
      end
      resources :customers, only: [:show, :index]

      namespace :invoices do
        controller :search do
          get '/find' => :show
          get '/find_all' => :index
        end
          get '/random' => "random#show"
          get '/:id/transactions' => "transactions#index"
          get '/:id/invoice_items' => "invoice_items#index"
          get '/:id/items' => "items#index"
          get '/:id/customer' => "customers#show"
          get '/:id/merchant' => "merchants#show"
      end
      resources :invoices, only: [:index, :show]

      namespace :invoice_items do
        controller :search do
          get '/find' => :show
          get '/find_all' => :index
        end
          get '/random' => "random#show"
          get '/:id/invoice' => "invoices#show"
          get '/:id/item' =>  "items#show"
      end
      resources :invoice_items, only: [:index, :show]

      namespace :items do
        controller :search do
          get '/find' => :show
          get '/find_all' => :index
        end
          get '/random' => "random#show"
          get '/:id/invoice_items' => "invoice_items#index"
          get '/:id/merchant' => "merchants#show"
          get '/:id/best_day' => "best_day#show"
          get '/most_items' => "most_items#index"
          get '/most_revenue' => "most_revenue#index"
      end
      resources :items, only: [:show, :index]

    end
  end



end
