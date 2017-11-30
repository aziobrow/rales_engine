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

      end
      resources :merchants, only: %i[show index]
        resources :items, only: [:show]
        resources :invoices, only: [:show]

      namespace :transactions do
        controller :search do
          get '/find' => :show
          get '/find_all' => :index
        end
          get '/random' => "random#show"
          get '/:id/invoice' => "invoices#index"
      end
      resources :transactions, only: %i[show index]
        resources :invoices, only: [:show]

      namespace :customers do
        controller :search do
          get '/find' => :show
          get '/find_all' => :index
        end
          get '/random' => "random#show"
          get '/:id/transactions' => "transactions#index"
          get '/:id/invoices' => "invoices#index"
      end
      resources :customers, only: %i[show index]

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
          get '/:id/merchant' => "merchants#index"
      end
      resources :items, only: %i[show index]

    end
  end



end
