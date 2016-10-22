class AddAttachmentIconToInstitutes < ActiveRecord::Migration
  def self.up
    change_table :institutes do |t|
      t.attachment :icon
    end
  end

  def self.down
    remove_attachment :institutes, :icon
  end
end
