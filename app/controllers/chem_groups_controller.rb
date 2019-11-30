class ChemGroupsController < ApplicationController

    def index
        @chem_groups = ChemGroup.all
    end

end
