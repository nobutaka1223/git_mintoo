class Like < ActiveRecord::Base
    
    belongs_to :post, counter_cache: :likes_count
    belongs_to :user, counter_cache: :likes_count
    
end
