class Api::CartItemsController < ApplicationController
    before_action :require_logged_in

    def index
        @cart_items = current_user.cart_items
        # render 'api/cart_items/index'
        render :index
    end
    
    def create
        @cart_item = CartItem.new(cart_item_params)

        if @cart_item.save
            render 'api/cart_items/index'
        else
            render json: @cart_item.errors, status: :unprocessable_entity
        end
    end

    def update
        @cart_item = CartItem.find(params[:id])

        if @cart_item.update(cart_item_params)
            render 'api/cart_items/index'
        else 
            render json: @cart_item.errors.full_messages, status: unprocessable_entity
        end 
    end

    def destroy
        @cart_item = CartItem.find(params[:id])

        if current_user.id == @cart_item.user_id
            @cart_item.destroy

        else
            render json: {errors: ["Unable to remove item from cart"]}
        end
    end

    def cart_item_params
        params.require(:cart_items).permit(:user_id, :product_id, :quantity)
    end
end
