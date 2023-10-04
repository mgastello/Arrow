class Api::ReviewsController < ApplicationController
    wrap_parameters include: Review.attribute_names + ['userId', 'productId', 'displayName']
    before_action :require_logged_in, only: [:create, :update, :destroy]

    def index
        @reviews = Product.find(params[:product_id]).reviews
        render :index
    end

    def show
        @review = Review.find(params[:id])
        render :show
    end

    def create
        @review = Review.new(review_params)

        if @review.save
            render :show
        else
            render json: { errors: @review.errors.full_messages }, status: :unprocessable_entity
        end
    end

    def update
        @review = Review.find(params[:id])

        if current_user.id == @review.user_id
            @review.update(review_params)
            render :show
        else
            render json: { errors: @review.errors.full_messages }, status: :unprocessable_entity
        end
    end

    def destroy
        @review = Review.find(params[:id])

        if current_user.id == @review.author_id
            @review.destroy
            render json: { message: 'successfully deleted' }
        else
            render json: { message: 'unable to delete review' }
        end
    end

    private

    def review_params
        params.require(:review).permit(:author_id, :product_id, :title, :body, :rating, :display_name)
    end
end
