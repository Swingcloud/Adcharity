class Advertisement < ApplicationRecord
	has_many :user_adships
  has_many :user, :through => :user_adships

  def self.find_by_randomize
  	self.order("RAND()").first
	end

end
