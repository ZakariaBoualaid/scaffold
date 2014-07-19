class ChangeTypeOfDescription < ActiveRecord::Migration
  def change
  	change_column :exercices, :description, :text
  end
end
