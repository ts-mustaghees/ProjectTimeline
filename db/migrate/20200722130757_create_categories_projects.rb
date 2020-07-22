class CreateCategoriesProjects < ActiveRecord::Migration[5.2]
  def change
    create_table :categories_projects do |t|
      t.references :category
      t.references :project

      t.timestamps
    end
  end
end
