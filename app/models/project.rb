class Project < ApplicationRecord
  has_and_belongs_to_many :categories
  has_and_belongs_to_many :technologies
  has_and_belongs_to_many :contributors

  mount_uploader :image, ProjectUploader
end
