class UserAdship < ApplicationRecord
	belongs_to :user
	belongs_to :advertisement
end
