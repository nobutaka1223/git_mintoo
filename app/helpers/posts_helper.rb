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
  
  
  #login_requiredは最初Basecontroller > Applicationcontrollerを作成しておいていた。（後下のcurrent____user)しかし、その内容もhelperに置き換えて上手くいった。
  
  
  def login_required
        @current___user = current___user
    unless @current___user
      redirect_to root_path
    end
  end
  
  
  #最初はlib/usersにおけとの指示があった、Seesionuserクラス。helperメソッドに置いたら動いた。クラスもここに置いていいんだね。
  class SessionUser
    def initialize(session)
      @name = session[:name]
      @uid = session[:user_id]
      @token = session[:oauth_token]
      @secret = session[:oauth_token_secret]
    end
  
    attr_reader :name, :uid, :token, :secret
  end
  

  private
  
  def current___user
  #sessionuserクラスからユーザー情報を取得するように
    @current___user ||= SessionUser.new(session) if session[:user_id]
    
  end

  
end
