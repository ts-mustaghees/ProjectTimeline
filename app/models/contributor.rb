class Contributor < ApplicationRecord
  has_and_belongs_to_many :projects
  has_and_belongs_to_many :technologies
end
