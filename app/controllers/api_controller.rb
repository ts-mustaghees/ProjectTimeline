class ApiController < ApplicationController
    # before_action :authenticate_admin!, except: [:index]
    # before_action :set_project, only: [:edit, :show, :update, :destroy]

    def projects
        data = nil
        category = request.query_parameters[:category] || '0'
        offset   = request.query_parameters[:offset] || 1

        total_projects = Project.count
        limit = 3

        if category != '0'
            data = Project.joins(:categories).where('categories.id': category).limit(limit).offset(offset)
        else
            data = Project.limit(limit).offset(offset)
        end

        render json: { data: data.as_json, more: (total_projects - offset.to_i) % limit }, status: 200
    end
end
