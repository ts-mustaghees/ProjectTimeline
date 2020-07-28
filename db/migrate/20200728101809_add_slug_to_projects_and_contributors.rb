class AddSlugToProjectsAndContributors < ActiveRecord::Migration[5.2]
  def change
    add_column :projects,     :slug, :string
    add_column :contributors, :slug, :string

    add_index :projects,     :slug, unique: true
    add_index :contributors, :slug, unique: true
  end
end
