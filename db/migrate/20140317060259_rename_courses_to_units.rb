class RenameCoursesToUnits < ActiveRecord::Migration
  def change
  	rename_table :courses, :units
  end
end
