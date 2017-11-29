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

      namespace :transactions do
        controller :search do
          get '/find' => :show
          get '/find_all' => :index
        end
          get '/random' => "random#show"
          get '/invoice' => "invoices#index"
      end
      resources :transactions, only: %i[show index]

      namespace :customers do
        controller :search do
          get '/find' => :show
          get '/find_all' => :index
        end
          get '/random' => "random#show"
          get '/transactions' => "transactions#index"
          get '/invoice' => "invoices#index"
      end
      resources :customers, only: %i[show index]

      namespace :invoices do
        controller :search do
          get '/find' => :show
          get '/find_all' => :index
        end
          get '/random' => "random#show"
          get '/transactions' => "transactions#index"
          get '/invoice_items' => "invoice_items#index"
          get '/items' => "items#index"
          get '/customer' => "customers#show"
          get '/merchant' => "merchants#show"
      end
      resources :invoices, only: [:index, :show]

      namespace :items do
        controller :search do
          get '/find' => :show
          get '/find_all' => :index
        end
          get '/random' => "random#show"
          get '/invoice_items' => "invoice_items#index"
          get '/:id/merchant' => "merchants#show"
      end
      resources :items, only: %i[show index]

    end
  end



end
