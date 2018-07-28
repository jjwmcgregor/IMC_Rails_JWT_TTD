class Cohort < ApplicationRecord
  belongs_to :course

  validates_presence_of :name, :start_date, :end_date, :course_id
end
