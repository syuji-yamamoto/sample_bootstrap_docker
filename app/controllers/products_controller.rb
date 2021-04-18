class ProductsController < ApplicationController
	def new
		@product = Product.new
	end

	def create
	end

	private

	def product_params
	end
end