class ChangeUserProjectshipsTotalDonationDefault < ActiveRecord::Migration[5.0]
  def change
  	change_column_default :user_projectships, :total_donation, 0
  end
end
