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
end
