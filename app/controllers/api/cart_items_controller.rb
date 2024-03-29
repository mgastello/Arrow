class Api::CartItemsController < ApplicationController
    wrap_parameters include: CartItem.attribute_names + ['userId', 'productId']
    before_action :require_logged_in

    def index
        @cart_items = current_user.cart_items
        render :index
    end

    def show
        @cart_item = CartItem.find(params[:id])
        render :show
    end
    
    def create
        @cart_item = CartItem.find_by(user_id: current_user.id, product_id: params[:product_id])

        if @cart_item
            @cart_item.quantity += params[:quantity]
        else
            @cart_item = CartItem.new(cart_item_params)
        end

        if @cart_item.save
            render :show
        else
            render json: @cart_item.errors, status: :unprocessable_entity
        end
    end

    def update
        @cart_item = CartItem.find(params[:id])

        if @cart_item.update(cart_item_params)
            render :show
        else 
            render json: @cart_item.errors.full_messages, status: :unprocessable_entity
        end 
    end

    def destroy
        @cart_item = CartItem.find(params[:id])

        if current_user.id == @cart_item.user_id
            @cart_item.destroy
            render json: { message: 'successfully removed' }
        else
            render json: {errors: ["Unable to remove item from cart"]}
        end
    end

    def cart_item_params
        params.require(:cart_item).permit(:user_id, :product_id, :quantity)
    end
end
