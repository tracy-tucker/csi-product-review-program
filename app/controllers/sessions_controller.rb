class SessionsController < ApplicationController

    layout false, only: [:welcome]

    def welcome
    end

    def destroy
        session.delete :user_id
        redirect_to '/'
    end

    def new
    end

    def create
        #google omniauth2 login
        if params[:provider]
            @user = User.create_by_google_omniauth(auth)
            session[:user_id] = @user.id
        else
            #does the user exist in the system?
            @user = User.find_by(username: params[:user][:username]) #checking for specific username. Using find_by bc won't throw an error
            #did we find use and did they enter right password?
            #if @user && user.authenticate(params[:user][:password]) --works the same as below
            if  @user.try(:authenticate, params[:user][:password]) #try is active support method. If no user, returns nil, if user then authenticates
                session[:user_id] = @user.id #storing a session key to the user
                redirect_to user_path(@user)
            else
                flash[:error] = "Sorry, username or password is incorrect. Please try again."
                redirect_to login_path #using redirect bc someone could be trying to guess your login info.
            end
        end
    end

    def omniauth
        @user = User.create_by_google_omniauth(auth)
        session[:user_id] = @user.id
        redirect_to user_path(@user)
    end

    private

    def auth
        request.env['omniauth.auth']
    end
    
end