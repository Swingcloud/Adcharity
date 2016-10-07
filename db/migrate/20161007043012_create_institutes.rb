class CreateInstitutes < ActiveRecord::Migration[5.0]
  def change
    create_table :institutes do |t|
    	t.string :name, :null => false
    	t.text :description
    	t.string :telephone
    	t.string :email
    	t.string :address
      t.timestamps
    end
  end
end
