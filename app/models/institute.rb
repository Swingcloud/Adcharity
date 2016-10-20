class Institute < ApplicationRecord
	validates_presence_of [:name, :description]
	has_many :projects


	has_attached_file :icon,
  :styles => {:original => ['1024x1024>' , :png] , :public => ['640x640>' , :png] , :view => ['360x360#' , :png]},
  :convert_options => {
    :original => '-coalesce -sample "1024x1024>" -colorspace sRGB' ,
    :public => '-background white -gravity center -extent 640x640 -colorspace sRGB -quality 70',
    :view => '-colorspace sRGB -quality 60'
  },
  :path => ":rails_root/public/uploads/images/:id_:style_:fingerprint.:extension",
  :url => "/uploads/images/:id_:style_:fingerprint.:extension",
  default_url: "/images/:style/missing.png"
  validates_attachment_content_type :icon, content_type: /\Aimage\/.*\z/
end
