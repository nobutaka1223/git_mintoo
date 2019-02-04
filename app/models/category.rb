class Category < ActiveRecord::Base
  belongs_to :user
  belongs_to :oyacategories
  has_many :tools
  has_many :posttools,  through: :tools
  validates :name,  presence: true
  
  
  def post_tools_count()
    
    posts_num = 0
    
    self.tools.each do |t|
      posts_num += t.posttools.count
    end
      
   return posts_num
      
  end 
  
  
  
end
