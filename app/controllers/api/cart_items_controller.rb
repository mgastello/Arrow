class Api::CartItemsController < ApplicationController
    before_action :require_logged_in

    def index
        @cart = Cart_items.all
        render 'api/cart_items/index'
    end
    
    def create
        @cart = Cart_items.new
    end

    def update

    end

    def destroy

    end
end
