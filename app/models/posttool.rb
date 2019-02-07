class Posttool < ActiveRecord::Base
  belongs_to :post
  belongs_to :tool
  
  
end
