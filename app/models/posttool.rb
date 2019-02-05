class Posttool < ActiveRecord::Base
  belongs_to :post
  belongs_to :tool
  
  validates :tool_id, presence:true
end
