class Advertisement < ApplicationRecord
	has_many :user_adships
  has_many :user, :through => :user_adships
end
