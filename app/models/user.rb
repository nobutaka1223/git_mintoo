class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable
  has_many :posts, dependent: :destroy
  has_many :comments,  dependent: :destroy
  has_many :likes,  dependent: :destroy
  has_many :mypage_comments, dependent: :destroy
  
  has_attached_file :avatar,
                      styles: { medium: "300x300#", thumb: "100x100" }
  validates_attachment_content_type :avatar,
                                      content_type: ["image/jpg", "image/jpeg", "image/png"]
                                      
  
 
  
  # user.find_for_oauthはメソッド内でcurrent_user等のメソッドが使えなかったが、controllerから引数で渡してあげればできる。
  def self.find_for_oauth(auth,usersignedin,userself)
    
    
    user = User.where(accesstoken: auth.credentials.token, provider: auth.provider).first

    
    
    
    if user
    
        return user
        
    elsif user == nil && usersignedin == true  then
    
     
 
          user = userself.update_attributes(
            provider: auth.provider,
            accesstoken: auth.credentials.token,
            secrettoken: auth.credentials.secret
            
            )
        
        return user
        
    elsif user == nil && usersignedin == false  then
      
          
    end
    
  end
  
  private
  
  #メアドでの認証も実装している場合ダミーのemailアドレスが必要になるので、そのためのメソッド。架空のメアドが無効な場合はこれでは意味をなさない。
  def self.dummy_email(auth)
    "#{auth.uid}-#{auth.provider}@example.com"
  end
  
  
  #remembelableでtwitterのAPIも永続的なログインできるのか
  
  
  

  
  
end
