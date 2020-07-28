class Admins::AdminsController < ApplicationController
    before_action :authenticate_admin!

    layout 'admin'

    def show
        @new_project  = Project.new
        @projects     = Project.left_outer_joins(:categories).group("projects.id").select(:id, :title, :slug, "count(categories.id) as categories_count")
        @technologies = Technology.all
        @categories   = Category.all
        @contributors = Contributor.all
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
        @contributors    = Contributor.left_outer_joins(:projects).group("contributors.id").select(:id, :name, :slug, "count(projects.id) as projects_count")
        @technologies    = Technology.all
    end
end