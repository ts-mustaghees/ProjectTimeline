class TechnologiesController < ApplicationController
    before_action :authenticate_admin!
    before_action :set_technology, only: [:edit, :update]

    def edit
        respond_to do |format|
            format.js
        end
    end

    def create
        new_tech = Technology.new(permitted_params)

        if new_tech.save
            flash[:success] = new_tech.title + ' created!'
        else
            flash[:danger] = new_tech.title + ' could not be created!'
            flash[:danger] += " <strong>#{new_tech.errors.full_messages[0]}</strong>" 
        end

        redirect_to request.referrer
    end
    
    def update
        old_title = @technology.title

        if @technology.update_attributes(permitted_params)
            flash[:success] = "#{old_title} updated to #{@technology.title}"
        else
            flash[:danger] = @technology.title + ' could not be updated!'
            flash[:danger] = " <strong>#{@technology.errors.full_messages[0]}</strong>"
        end

        redirect_to request.referrer
    end

    def destroy
        technology = Technology.find(params[:id])

        if technology.destroy
            flash[:success] = technology.title + ' deleted!'
        else
            flash[:danger] = 'Could not delete. Something went wrong.'
        end

        redirect_to request.referrer
    end

    private
        def set_technology
            @technology = Technology.find_by(id: params[:id])
        end

        def permitted_params
            params.require(:technology).permit(:title)
        end
end