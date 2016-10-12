class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, :omniauth_providers => [:facebook]

  has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/

  has_many :user_projectships
  has_many :projects, :through => :user_projectships

  has_many :user_adships
  has_many :advertisements, :through => :user_adships





  def self.from_omniauth(auth, cookie)
    # Case 1: Find existing user by facebook uid
    user = User.find_by_fb_uid( auth.uid )
    if user
        user.fb_token = auth.credentials.token
        user.avatar = auth.info.image
        #user.fb_raw_data = auth
        user.save!
    return user
  	end

	  # Case 2: Find existing user by email
	  existing_user = User.find_by_email( auth.info.email )
	  if existing_user
	    existing_user.fb_uid = auth.uid
     	existing_user.fb_token = auth.credentials.token	
     	#existing_user.fb_raw_data = auth
	    existing_user.save!
	    return existing_user
    end

    # Case 3: Create new password
    user = User.new
    user.fb_uid = auth.uid
    user.fb_token = auth.credentials.token
    user.email = auth.info.email
    user.name = auth.info.name
    user.nickname = auth.info.name
    user.avatar = auth.info.image
    user.password = Devise.friendly_token[0,20]
    #user.fb_raw_data = auth
    user.save!
    user.first_time_watch_ad?(cookie)
    return user
  end

  # @user = User.find(1)
  # In controller: @user.first_time_watch_ad?(cookies[:user_first_sign_up])
  def first_time_watch_ad?(cookie)
  	if cookie
  		UserAdship.create( :user_id => self.id , :advertisement_id => cookie)   
  	end
  end
       

end
