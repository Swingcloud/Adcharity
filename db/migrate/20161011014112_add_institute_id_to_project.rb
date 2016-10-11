class AddInstituteIdToProject < ActiveRecord::Migration[5.0]
  def change
  	add_column :projects, :institute_id, :integer
  end
end
