class CreateUnits < ActiveRecord::Migration
	def change
		create_table :units do |t|
			t.string :name
			t.string :slug
			t.references :mod, index: true
		end
	end
end