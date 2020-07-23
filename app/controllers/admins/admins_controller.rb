class Admins::AdminsController < ApplicationController
    layout 'admin'

    def show
        @projects = Project.all
    end

    def categories
        @categories = Category.all
    end

    def technologies
        @technologies = Technology.all
    end

    def contributors
        @contributors = Contributor.all
    end
end