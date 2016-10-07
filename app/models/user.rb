class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :user_projectships
  has_many :projects, :through => :user_projectships

  has_many :user_adships
  has_many :advertisements, :through => :user_adships

end
