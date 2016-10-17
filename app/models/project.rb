class Project < ApplicationRecord
	has_many :user_projectships
	has_many :users , :through => :user_projectships
	belongs_to :institute
  
	has_attached_file :image,
  :styles => {:original => ['1024x1024>' , :jpg] , :public => ['640x640>' , :jpg] , :view => ['360x360#' , :jpg]},
  :convert_options => {
    :original => '-coalesce -sample "1024x1024>" -colorspace sRGB' ,
    :public => '-background white -gravity center -extent 640x640 -colorspace sRGB -quality 70',
    :view => '-colorspace sRGB -quality 60'
  },
  :path => ":rails_root/public/uploads/images/:id_:style_:fingerprint.:extension",
  :url => "/uploads/images/:id_:style_:fingerprint.:extension",
  default_url: "/images/:style/missing.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

  scope :newest_article, ->{ limit(3).order("created_at DESC")}
  scope :highlighted_article, ->{ where(:status => true)}

end
