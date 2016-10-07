class CreateProjects < ActiveRecord::Migration[5.0]
  def change
    create_table :projects do |t|
    	t.string :name, :null => false, :limit => 20, :index => true
    	t.text :description
    	t.integer :donate_amount


      t.timestamps
    end
  end
end
