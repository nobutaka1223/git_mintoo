module PostsHelper
    
    
    def youtube(post)
    iframe = content_tag(
      :iframe,
      '', # empty body
      width: 560,
      height: 315,
      src: "#{post[:youtube]}",
      frameborder: 0,
      allowfullscreen: true
    )
    content_tag(:div, iframe, class: 'youtube-container')
  end
  
  def test
     puts "test"
  end
  
end
