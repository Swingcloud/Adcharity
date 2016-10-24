class AddAdvertisementName < ActiveRecord::Migration[5.0]
  def change
  	add_column :advertisements, :name , :string
  end
end
