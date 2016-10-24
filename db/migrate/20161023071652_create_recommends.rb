class CreateRecommends < ActiveRecord::Migration[5.0]
  def change
    create_table :recommends do |t|
    	t.integer :recommend_user, :null => false
    	t.string :phone_number, :null => false
    	t.string :email, :null => false
    	t.string :recommend_inst, :null => false
    	t.string :category, :default => ""
    	t.string :type
    	t.string :inst_project
    	t.text :description
    end
  end
end
