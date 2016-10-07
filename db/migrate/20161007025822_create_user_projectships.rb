class CreateUserProjectships < ActiveRecord::Migration[5.0]
  def change
    create_table :user_projectships do |t|
    	t.integer :user_id, :index => true
    	t.integer :project_id, :index => true
    	t.integer :total_donation
    	t.boolean :status, :default => false
      t.timestamps
    end
  end
end
