class AddEnglishNameToInstitute < ActiveRecord::Migration[5.0]
  def change
  	add_column :institutes, :english_name, :string, :default => ""
  end
end
