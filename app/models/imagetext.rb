class Imagetext < ActiveRecord::Base
  belongs_to :post
  enum status: {ichiban: 0, niban: 1, sanban: 2, yoban: 3, goban: 4, rokuban: 5 }
  
  

  mount_uploader :image, ImageUploader
end
