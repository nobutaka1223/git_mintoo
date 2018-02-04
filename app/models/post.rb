class Post < ActiveRecord::Base
    belongs_to :user
    belongs_to :tool
    
    mount_uploader :image, ImageUploader

end
