class CatalogsController < ApplicationController
	def new
	end

	def create
	end

	def edit
	end

	def update
	end

	def destroy
	end

	def index
	end

	def show
		catalog = Catalog.includes(
			:products,
			:catalog_trend,
			:sub_sub_category
		).find(params[:id] || params[:catalog_id])
	end
end
