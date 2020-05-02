Rails.application.routes.draw do
  devise_for :suppliers, controllers: { sessions: "suppliers/sessions", registrations: "suppliers/registrations" }
  devise_for :clients, controllers: { sessions: "clients/sessions", registrations: "clients/registrations" }
  
  namespace 'api', :defaults => { :format => :json } do
  	namespace 'v1' do
  		resources :addresses
  		resources :categories
  		resources :cities
  		resources :clients
  		resources :orders

  		resources :products do
        collection do
          get 'per_category'
        end
      end
  		
      resources :suppliers
  	end
  end

end
