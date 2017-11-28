Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      resources :invoices, only: [:index, :show]
      namespace :invoices do
        controller :search do
          get "/find" => :show
          get "/find_all" => :index
        end
      end

      resources :merchants, only: [:index, :create, :show]
      namespace :merchants do
        controller :search do
          get "/find" => :show
          get "/find_all" => :index
        end
      end
      
    end
  end



end
