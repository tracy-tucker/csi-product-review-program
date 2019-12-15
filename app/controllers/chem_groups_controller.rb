class ChemGroupsController < ApplicationController

    def index
        @chem_groups = ChemGroup.all
    end
    
    def new
        if logged_in?
            @chem_group = ChemGroup.new
        else
            flash[:error] = "Sorry, you must be logged in to create a new chemical group."
            redirect_to chem_groups_path
        end
    end

    def create
        @chem_group = ChemGroup.new(chem_group_params)
        # @chem_group.user_id = session[:user_id] #bc chem_group belongs_to user. user_id required from model
        if @chem_group.save #validation
            redirect_to chem_groups_path
        else
            render :new
        end
    end

    private

    def chem_group_params
        params.require(:chem_group).permit(:name)
    end

end
