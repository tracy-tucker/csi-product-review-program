class ApplicationAreasController < ApplicationController

    def index
        @application_areas = ApplicationArea.all
    end
    
    def new
        if logged_in?
            @application_area = ApplicationArea.new
        else
            flash[:error] = "Sorry, you must be logged in to create a new chemical group."
            redirect_to application_areas_path
        end
    end

    def create
        @application_area = ApplicationArea.new(application_area_params)
        # @application_area.user_id = session[:user_id] #bc application_area belongs_to user. user_id required from model
        if @application_area.save #validation
            redirect_to application_areas_path
        else
            render :new
        end
    end

    private

    def application_area_params
        params.require(:application_area).permit(:area_name)
    end

end
