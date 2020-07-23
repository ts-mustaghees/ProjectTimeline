class ProjectsController < ApplicationController
    before_action :set_project, only: [:show, :update, :destroy]

    def index
        @projects = Project.all
    end

    def show
    end

    private
        def set_project
            @project = Project.find_by(id: params[:id])
        end
end
