class CategoriesController < ApplicationController
    def index
        @categories = Category.all
    end
    
    def new
        if logged_in?
            @category = Category.new
        else
            flash[:error] = "Sorry, you must be logged in to create a new category."
            redirect_to categories_path
        end
    end

    def create
        @category = Category.new(category_params)
        # @category.user_id = session[:user_id] #bc category belongs_to user. user_id required from model
        if @category.save #validation
            redirect_to categories_path
        else
            render :new
        end
    end

    private

    def category_params
        params.require(:category).permit(:name)
    end

end