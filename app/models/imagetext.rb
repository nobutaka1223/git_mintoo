class Imagetext < ActiveRecord::Base
  belongs_to :post
  
  validates :content,
          allow_blank: true,
          exclusion: { in: %w(nobutakaito) }
  validates :image,
          allow_blank: true,
          # バリデーションはallowblank以外に１つは含まないといけないので無理やりexclusion
          exclusion: { in: %w(nobutakaito) }
          
   validates :subtitle,
          allow_blank: true,
          # バリデーションはallowblank以外に１つは含まないといけないので無理やりexclusion
          exclusion: { in: %w(nobutakaito) }
  #test

  mount_uploader :image, ImageUploader
end
