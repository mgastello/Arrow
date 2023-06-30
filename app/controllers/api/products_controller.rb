class Api::ProductsController < ApplicationController
    def show
        @product = Product.find(params[:id])
        render :show
    end

    def index
        @products = Product.all
        render :index
    end

    def search
        # @products = Product.where("lower(name) LIKE ?", "%#{params[:products]}%")
        # @products = Product.where("name ILIKE ?", "%#{params[:products]}%")
        @products = Product.where("name ILIKE ? OR department ILIKE ?", "%#{params[:products]}%", "%#{params[:products]}%")
        render :search
    end
end
