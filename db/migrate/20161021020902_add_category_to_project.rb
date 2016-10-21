class AddCategoryToProject < ActiveRecord::Migration[5.0]
  def change
  	add_column :projects, :category, :string

  	add_index :projects, :category
  end


end
