Rails.application.routes.draw do
  namespace :admin do
    scope module: :spree do
      # Products
      resources :products do
        get :export, on: :collection

        scope module: :product do
          resources :images
          resources :prices

          resources :variants

          resources :stock_items
        end
      end
      
      resources :variants, only: %i[index show]

      resources :option_types
      resources :option_values
      resources :properties

      resources :taxonomies do
        resources :taxons
      end

      resources :taxons

      # Orders
      resources :orders, except: %i[edit update] do
        get :export, on: :collection

        member do
          put :cancel
          put :approve
          put :resend
        end

        scope module: :order do
          resources :line_items

          resources :line_item_adjustments, only: %i[index]
          resources :shipment_adjustments, only: %i[index]

          resources :adjustments
          resources :return_authorizations

          resources :payments, only: %i[index show new create] do
            member do
              patch :capture
              patch :void
            end

            resources :refunds
          end

          resources :reimbursements
          resources :cancellations

          resources :shipments
        end
      end

      resources :line_items, only: %i[index]

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
