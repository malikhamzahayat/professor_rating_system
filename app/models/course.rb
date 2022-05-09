class Course < ApplicationRecord
	has_many :professor_courses
	has_many :professors, through: :professor_courses
end
