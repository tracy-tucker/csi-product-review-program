class ChemGroupsController < ApplicationController

    def index
        @chem_groups = ChemGroup.all
    end
    
    def new
        if logged_in?
            @chem_group = ChemGroup.new
        end
    end

    def create
        @chem_group = ChemGroup.new(chem_group_params)
        @chem_group.user_id = session[:user_id] #bc product belongs_to user. user_id required from model
        if @chem_group.save #validation
            redirect_to products_path
        else
            render :new
        end
    end

    private

    def chem_group_params
        params.require(:chem_group).permit(:name)
    end

end
