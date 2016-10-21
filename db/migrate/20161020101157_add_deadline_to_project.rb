class AddDeadlineToProject < ActiveRecord::Migration[5.0]
  def change
  	add_column :projects, :deadline, :datetime
  end
end
