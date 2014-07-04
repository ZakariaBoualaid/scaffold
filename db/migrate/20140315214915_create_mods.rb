class CreateMods < ActiveRecord::Migration
  def change
    create_table :mods do |t|
      t.string :name
      t.string :description
      t.string :slug

      t.timestamps
    end
  end
end
