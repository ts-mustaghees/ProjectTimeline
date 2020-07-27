class ProjectsController < ApplicationController
    before_action :authenticate_admin!, except: [:index]
    before_action :set_project, only: [:edit, :show, :update, :destroy]

    def index
        @projects = Project.all
    end

    def edit
        @technologies = []
        Technology.select{ |t| @technologies << {id: t.id, title: t.title} }

        @categories = []
        Category.select{ |c| @categories << {id: c.id, name: c.name} }

        @contributors = []
        Contributor.select{ |c| @contributors << {id: c.id, name: c.name, email: c.email} }

        respond_to do |format|
            format.js
        end
    end

    def create
        new_project = Project.new(permitted_params)

        if new_project.save
            # Add technologies
            technologies = params[:technologies]
            technologies.each do |t|
                t = Technology.find_or_create_by(title: t)
                new_project.technologies << t
            end

            # Add categories
            categories = params[:categories]
            categories.each do |c|
                c = Category.find_or_create_by(name: c)
                new_project.categories << c
            end

            # Add contributors
            contributors = params[:contributors]
            contributors.each do |c|
                c = Contributor.find(c)
                new_project.contributors << c
            end

            flash[:success] = new_project.title + ' created!'
        else
            flash[:danger] = new_project.title + ' could not be created!'
            flash[:danger] += " <strong>#{new_project.errors.full_messages[0]}</strong>" 
        end

        redirect_to request.referrer
    end

    def update
        if @project.update_attributes(permitted_params)
            technologies = params[:technologies]

            technologies.each do |t|
                t = Technology.find_or_create_by(title: t)
                if !@project.technologies.include? t
                    @project.technologies << t
                end
            end

            # remove non-submitted technologies
            project_technologies = @project.technologies
            project_technologies.each do |t|
                if !technologies.include? t.title
                    @project.technologies.delete(t)
                end
            end

            categories   = params[:categories]

            categories.each do |c|
                c = Category.find_or_create_by(name: c)
                if !@project.categories.include? c
                    @project.categories << c
                end
            end

            # remove non-submitted categories
            project_categories = @project.categories
            project_categories.each do |c|
                if !categories.include? c.name
                    @project.categories.delete(c)
                end
            end

            contributors = params[:contributors].map(&:to_i)

            contributors && contributors.each do |c|
                c = Contributor.find(c)
                if !@project.contributors.include? c
                    @project.contributors << c
                end
            end

             # remove non-submitted contributors
             project_contributors = @project.contributors
             project_contributors.each do |c|
                 if !contributors.include? c.id
                     @project.contributors.delete(c)
                 end
             end

            flash[:success] = @project.title + ' updated!'
        else
            flash[:danger] = @project.title + ' could not be updated!'
            flash[:danger] = " <strong>#{@project.errors.full_messages[0]}</strong>"
        end

        redirect_to request.referrer
    end

    def destroy
        project = Project.find(params[:id])

        if project.destroy
            flash[:success] = project.title + ' deleted!'
        else
            flash[:danger] = 'Could not delete. Something went wrong.'
        end

        redirect_to request.referrer
    end

    private
        def set_project
            @project = Project.find_by(id: params[:id])
        end

        def permitted_params
            params.require(:project).permit(:title, :image, :start_date, :finish_date, :description)
        end
end
