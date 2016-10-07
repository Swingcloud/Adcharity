class CreateAdvertisements < ActiveRecord::Migration[5.0]
  def change
    create_table :advertisements do |t|
    	t.string :ad_href
    	t.decimal :price_per_look, :precision => 4 ,:scale => 2
    	t.integer :total_view


      t.timestamps
    end
  end
end
