Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

	# namespace :api do
	# 	namespace :v1 do
	# 		resources :customer_subscriptions, only: [:index, :create, :destroy, :update]
	# 	end
	# end

	namespace :api do
		namespace :v1 do
			resources :customer, ony: :show do
				resources :subscriptions, only: [:index, :create, :destroy, :update], module: 'customers'
			end
		end
	end
end
