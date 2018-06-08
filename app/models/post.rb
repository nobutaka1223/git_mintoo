class Post < ActiveRecord::Base
    belongs_to :user
    belongs_to :tool
    
    has_many :comments
    has_many :likes
    has_many :imagetexts
    accepts_nested_attributes_for :imagetexts, reject_if: proc {|attributes| attributes['image'].blank?}
    
    
    validates :title,  presence: true
    validates :tool_id,       presence: true
    
    
    
    def like_user(user_id)
        likes.find_by(user_id: user_id)
    end
    #テンプレートではpost.like_userとしている。この時postにPostモデルのレコードが入っていなければならず、そのPostidとuseridでlikeモデルのインスタンスを返す。
    #また、メソッドはwhereでなくfind byでよい。
    
    

end
