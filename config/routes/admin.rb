Rails.application.routes.draw do
  namespace :admin do
    scope module: :spree do
      # Products
      resources :products do
        get :export, on: :collection
        post :clone, on: :member

        scope module: :product do
          resources :images
          resources :prices

          resources :variants

          resources :stock_items
        end
      end
      
      resources :variants, only: %i[index show] do
        scope module: :variant do
          resources :images
          resources :prices
        end
      end
      resources :product_properties, only: %i[index show]

      # Product Properties
      resources :option_types
      resources :option_values
      resources :properties

      # Taxonomies
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

          resources :shipments
          resources :adjustments
          resources :return_authorizations
          resources :customer_returns

          resources :payments, only: %i[index show new create] do
            member do
              patch :capture
              patch :void
            end

            resources :refunds
          end

          resources :reimbursements
          resources :cancellations
        end
      end

      resources :line_items, only: %i[index]

      # Promotions
      resources :promotions do
        resources :codes
        
        scope module: :promotion do
          resources :rules, except: %i[edit update]
          resources :actions, except: %i[edit update]

          scope module: :rules do
            with_options except: %i[index] do
              resources :first_orders
              resources :first_repeat_purchase_sinces
              resources :item_totals
              resources :nth_orders
              resources :one_use_per_users
              resources :option_values
              resources :products
              resources :stores
              resources :taxons
              resources :user_logged_ins
              resources :user_roles
            end
          end

          scope module: :actions do
            with_options except: %i[index] do
              resources :create_adjustments
              resources :create_item_adjustments
              resources :create_quantity_adjustments
              resources :free_shippings
            end
          end
        end
      end

      resources :promotion_categories

      # Stock
      resources :stock_items
      resources :stock_locations
      resources :stock_movements

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
