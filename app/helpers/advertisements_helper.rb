module AdvertisementsHelper

	def embed_autoplay(youtube_url)
    youtube_id = youtube_url.split("=").last
    content_tag(:iframe, nil, src: "//www.youtube.com/embed/#{youtube_id}?autoplay=1&controls=0&?enablejsapi=1", :id =>"existing-iframe-example")
  end

  def ad_href(youtube_url)
  	youtube_id = youtube_url.split("=").last
  	return youtube_id
  end

  def embed(youtube_url)
    youtube_id = youtube_url.split("=").last
    content_tag(:iframe, nil, src: "//www.youtube.com/embed/#{youtube_id}")
  end
  
end
