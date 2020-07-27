class Admins::AdminsController < ApplicationController
    before_action :authenticate_admin!

    layout 'admin'

    def show
        @new_project = Project.new
        @projects    = Project.all
    end

    def categories
        @new_category = Category.new
        @categories   = Category.left_outer_joins(:projects).group("categories.id").select(:id, :name, "count(projects.id) as projects_count")
    end

    def technologies
        @new_technology = Technology.new
        @technologies   = Technology.left_outer_joins(:projects).group("technologies.id").select(:id, :title, "count(projects.id) as projects_count")
    end

    def contributors
        @new_contributor = Contributor.new
        @contributors    = Contributor.left_outer_joins(:projects).group("contributors.id").select(:id, :name, "count(projects.id) as projects_count")
    end
end