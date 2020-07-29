class ProjectsIndex < Chewy::Index
    define_type Project.includes(:categories, :technologies, :contributors).all do
        field :title

        field :categories,   value: ->(project) { project.categories }
        field :technologies, value: ->(project) { project.technologies }
        field :contributors, value: ->(project) { project.contributors }
    end
end