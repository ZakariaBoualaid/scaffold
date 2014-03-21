class CreateExercices < ActiveRecord::Migration
  def change
    create_table :exercices do |t|
      t.references :lesson, index: true
      t.text :content

      t.timestamps
    end
  end
end
