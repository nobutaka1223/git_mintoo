class Oyacategory < ActiveRecord::Base
    
    has_many :categories
    has_many :tools,  through: :categories
    belongs_to :user
    
    validates :name,  presence: true
    
    
    
    
    def posts_counts()
     tools = self.tools
     posts_num = 0
     
     tools.each do |t|
       posts_num += t.posts.count
     end
     
     return posts_num
    
    end
    
    
    
    
end
