class AddDescriptionToExercice < ActiveRecord::Migration
  def change
    add_column :exercices, :description, :string
  end
end
