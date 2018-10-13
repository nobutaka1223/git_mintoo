class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable
  has_many :posts
  has_many :comments
  has_many :likes
  
  has_attached_file :avatar,
                      styles: { medium: "300x300#", thumb: "100x100" }
  validates_attachment_content_type :avatar,
                                      content_type: ["image/jpg", "image/jpeg", "image/png"]
  
  
  
  def self.find_for_oauth(auth)
    
    user = User.where(uid: auth.uid, provider: auth.provider).first


    unless user
      user = User.create(
        uid:        auth.uid,
        provider:   auth.provider,
        email:      User.dummy_email(auth),
        password:   Devise.friendly_token[0,20],
       
        
        )
    end
    
    return user
    
  end
  
  private
  
  #メアドでの認証も実装している場合ダミーのemailアドレスが必要になるので、そのためのメソッド。架空のメアドが無効な場合はこれでは意味をなさない。
  def self.dummy_email(auth)
    "#{auth.uid}-#{auth.provider}@example.com"
  end
  
  
  #remembelableでtwitterのAPIも永続的なログインできるのか
 
  
  
end
