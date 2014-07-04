class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.string :name
      t.string :slug
      t.text :description
      t.references :unit, index: true

      t.timestamps
    end
  end
end
