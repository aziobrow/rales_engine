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
      end
      resources :transactions, only: %i[show index]

      namespace :invoices do
        controller :search do
          get '/find' => :show
          get '/find_all' => :index
        end
          get '/random' => "random#show"
      end


    end
  end



end
