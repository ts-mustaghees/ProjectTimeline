class ContributorsController < ApplicationController
    before_action :authenticate_admin!, except: [:index]
    before_action :set_contributor, only: [:edit, :update]

    def index
        @contributors = Contributor.all
    end

    def edit
        @technologies = []
        Technology.select{ |t| @technologies << {id: t.id, title: t.title} }

        respond_to do |format|
            format.js
        end
    end

    def create

    end

    def update
        if @category.update_attributes(permitted_params)
            flash[:success] = @category.name + ' updated!'
        else
            flash[:danger] = @category.name + ' could not be updated!'
            flash[:danger] = " <strong>#{@category.errors.full_messages[0]}</strong>"
        end

        redirect_to request.referrer
    end

    def destroy

    end

    private
        def set_contributor
            @contributor = Contributor.find_by(id: params[:id])
        end
end
