class ReviewsController < ApplicationController

    def new
        if logged_in?
            if @product = Product.find_by_id(params[:product_id]) #bc review belongs_to product and nested
                @review = @product.reviews.build #used when we have a nested route
            else #the new review request is NOT nested
                @review = Review.new
            end
        else
            flash[:error] = "Sorry, you must be logged in to create a new review."
            redirect_to reviews_path
        end
    end

    def create
        @review = current_user.reviews.build(review_params)
        if @review.save #is the review valid with a product_id?
            redirect_to review_path(@review)
        else
            render :new
        end
    end

    def index #good to nest to show all reviews for 1 product, based on URL path
        #how to check if nested
        if @product = Product.find_by_id(params[:product_id])
        #nested
            @reviews = @product.reviews
        else
        #not nested
            @reviews = Review.all
        end
    end

    def show
        @review = Review.find_by_id(params[:id])
    end

    private

    def review_params
        params.require(:review).permit(:product_id, :rating, :title, :content)
    end
    
end
