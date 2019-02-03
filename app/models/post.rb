class Post < ActiveRecord::Base
    belongs_to :user
    belongs_to :tool
    # dependent:destroyはpostレコードを削除したときに外部キーを持つテーブルのレコードも削除してくれる。

    has_many :comments, dependent: :destroy
    has_many :likes, dependent: :destroy
    has_many :imagetexts, dependent: :destroy
    has_many :posttools, dependent: :destroy
    
    accepts_nested_attributes_for :imagetexts ,allow_destroy: true,
      reject_if: proc {|attributes| 
      attributes['image'].blank? && attributes['content'].blank? && attributes['subtitle'].blank?}
    # rejectifでcontentかimageかsubtitleがない場合はレコードを作成しない
    

    accepts_nested_attributes_for :posttools ,allow_destroy: true

    
    validates :title,  presence: true
   
    
    
    
    def like_user(user_id)
        likes.find_by(user_id: user_id)
    end
    #テンプレートではpost.like_userとしている。この時postにPostモデルのレコードが入っていなければならず、そのPostidとuseridでlikeモデルのインスタンスを返す。
    #また、メソッドはwhereでなくfind byでよい。
    
    

end
