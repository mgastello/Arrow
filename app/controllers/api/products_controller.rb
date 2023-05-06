class Api::ProductsController < ApplicationController
    def show
        @product = Product.find(params[:id])
        # render 'api/products/show'
        render :show
    end

    def index
        @products = Product.all
        # render 'api/products/index'
        render :index
    end

    def search
        @products = Product.where("lower(name) LIKE ?", "%#{params[:products]}%")				# products is query string 		anything after "?q" in url
        render :search
    end
end
