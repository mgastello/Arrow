class Api::FavoritesController < ApplicationController
    wrap_parameters include: Favorite.attribute_names + ['userId', 'productId']

    def index
        @favorites = current_user.favorites
        render :index
    end

    def show
        @favorite = Favorite.find(params[:id])
        render :show
    end
    
    def create
        @favorite = Favorite.find_by(user_id: current_user.id, product_id: params[:product_id])

        if !@favorite
            @favorite = Favorite.new(user_id: current_user.id, product_id: params[:product_id])
        end

        if @favorite.save
            render :show
        else
            render json: @favorite.errors, status: :unprocessable_entity
        end
    end

    def destroy
        @favorite = Favorite.find(params[:id])

        if current_user.id == @favorite.user_id
            @favorite.destroy
            render json: { message: 'successfully removed' }
        else
            render json: {errors: ["Unable to remove item from cart"]}
        end
    end
end
