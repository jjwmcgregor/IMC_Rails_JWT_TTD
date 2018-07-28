class Course < ApplicationRecord
  has_many :cohorts, dependent: :destroy

  validates_presence_of :name, :created_by
end
