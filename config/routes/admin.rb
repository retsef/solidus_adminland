Rails.application.routes.draw do
  namespace :admin do
    scope module: :spree do
      # Products
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
      resources :option_values
      resources :properties

      resources :taxonomies do
        resources :taxons
      end

      resources :taxons

      # Orders
      resources :orders do
        get :export, on: :collection
        
        resources :line_items

        resources :adjustments
        resources :return_authorizations

        resources :payments
        resources :reimbursements
        resources :cancellations

        scope module: :order do
        end
      end

      # Promotions
      resources :promotions do
        resources :codes

        resources :rules
        resources :actions
        
        scope module: :promotion do
        end
      end

      resources :promotion_categories

      # Stock
      resources :stock_items
      resources :stock_locations

      # Users
      resources :users

      # Settings
      resources :stores

      resources :payment_methods, except: %i[edit update]
      namespace :payment_method do
        resources :store_credits, except: %i[index]
        resources :checks, except: %i[index]
        resources :credit_cards, except: %i[index]
      end

      resources :shipping_methods
      resources :shipping_categories

      resources :tax_categories
      resources :tax_rates

      resources :zones
      resources :countries
      resources :states
    end
  end
end
