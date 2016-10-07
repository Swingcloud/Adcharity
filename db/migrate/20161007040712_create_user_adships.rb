class CreateUserAdships < ActiveRecord::Migration[5.0]
  def change
    create_table :user_adships do |t|
    	t.integer :user_id, :index => true
    	t.integer :advertisement_id, :index => true

      t.timestamps
    end
  end
end
