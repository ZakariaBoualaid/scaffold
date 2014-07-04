class CreateExercicesUser < ActiveRecord::Migration
	def change
		create_table :exercices_users do |t|
			t.belongs_to :exercice
			t.belongs_to :user
		end
	end
end