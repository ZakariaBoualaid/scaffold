class AddSlugToMod < ActiveRecord::Migration
  def change
    add_column :mods, :slug, :string
  end
end
