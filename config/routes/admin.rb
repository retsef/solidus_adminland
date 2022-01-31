Rails.application.routes.draw do
  namespace :admin do
    scope module: :spree do
      # resources :users

      resources :products do
        get :export, on: :collection
        
        resources :product_properties
        resources :images
        resources :variants
        resources :prices

        scope module: :product do
        end
      end
      
      resources :option_types
      resources :properties

      resources :orders do
        get :export, on: :collection
        
        resources :adjustments
        resources :return_authorizations

        resources :payments
        resources :reimbursements
        resources :cancellations

        scope module: :order do
        end
      end

      resource :promotions do
        resources :promotion_rules
        resources :promotion_actions
        
        scope module: :promotion do
        end
      end

      resources :taxonomies do
        resources :taxons
      end

      resources :taxons

      resources :stores
    end
  end
end
