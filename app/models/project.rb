class Project < ApplicationRecord
	has_many :user_projectships
	has_many :users , :through => :user_projectships
	belongs_to :user
	blongs_to :institute

	

end