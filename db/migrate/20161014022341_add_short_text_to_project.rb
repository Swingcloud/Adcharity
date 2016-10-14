class AddShortTextToProject < ActiveRecord::Migration[5.0]
  def change
  	add_column :projects, :short_text, :text
  end
end
