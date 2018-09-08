Rails.application.routes.draw do

	resources :catalogs do
		resources :products
	end

	resources :categories, :catalog_trends, :sub_categories, :sub_sub_categories, :collections
	# For details on the DSL available within this file, see
end
