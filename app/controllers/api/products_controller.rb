class Api::ProductsController < ApplicationController
    def show
        @product = Products.find(params[:id])
        render 'api/products/show'
    end

    def index
        @products = Products.all
        render 'api/products/index'
    end
end
