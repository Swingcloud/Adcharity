class AddStatusToProject < ActiveRecord::Migration[5.0]
  def change
  	add_column :projects, :status, :boolean, :default => false
  end
end
