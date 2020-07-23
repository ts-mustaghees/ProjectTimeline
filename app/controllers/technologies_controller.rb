class TechnologiesController < ApplicationController
    before_action :authenticate_admin!
    before_action :set_technology, only: [:edit, :update, :destroy]

    def edit
        respond_to do |format|
            format.js
        end
    end
    
    def update
        flash[:success] = @technology.title + ' updated!'
        redirect_to request.referrer
    end

    def destroy
        flash[:success] = @technology.title + ' destroyed!'
        redirect_to request.referrer
    end

    private
        def set_technology
            @technology = Technology.find_by(id: params[:id])
        end
end