class AddNameToExercice < ActiveRecord::Migration
  def change
    add_column :exercices, :name, :string
  end
end
