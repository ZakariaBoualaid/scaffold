class ExercicesUser < ActiveRecord::Base
	belongs_to :exercice
	belongs_to :user
end