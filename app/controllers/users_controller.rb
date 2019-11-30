class UsersController < ApplicationController
    
    def new
        @user = User.new #define a new user
    end

    def create
        @user = User.new(user_params)
        if @user.save
            session[:user_id] = @user.id
            redirect_to user_path(@user)
        else
            flash[:error] = "Sorry, user already exists. Please try again."
            render :new
        end
    end

    def show
        @user = User.find_by_id(params[:id])
        redirect_to '/' if !@user #if user doesn't exist, goes home
    end

    def user_most_reviews
        @user = User.user_most_reviews.first
    end

    private

    def user_params
        params.require(:user).permit(:username, :password)
    end

end
