class Post < ActiveRecord::Base
    belongs_to :user
    belongs_to :tool
    
    has_many :comments
    has_many :likes
    
    
    def like_user(user_id)
        likes.find_by(user_id: user_id)
    end
    #テンプレートではpost.like_userとしている。この時postにPostモデルのレコードが入っていなければならず、そのPostidとuseridでlikeモデルのインスタンスを返す。
    #また、メソッドはwhereでなくfind byでよい。
    
    mount_uploader :image, ImageUploader

end
