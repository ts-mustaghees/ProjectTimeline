class CreateContributorsAndTechnologies < ActiveRecord::Migration[5.2]
  def change
    create_table :contributors do |t|
      t.string :name, null: false, default: ""
      t.string :email
      t.string :image
      t.text   :description

      t.date   :join_date
      t.date   :left_date

      t.timestamps
    end

    create_table :technologies do |t|
      t.string :title, null: false, default: ""

      t.timestamps
    end

    create_table :contributors_projects, id: false do |t|
      t.references :contributor
      t.references :project
    end

    create_table :projects_technologies, id: false do |t|
      t.references :project
      t.references :technology
    end

    add_index :contributors_projects, [:contributor_id, :project_id], unique: true
    add_index :projects_technologies, [:project_id, :technology_id],  unique: true
    add_index :categories_projects,   [:category_id, :project_id],    unique: true
  end
end
