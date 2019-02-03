class Tool < ActiveRecord::Base
    has_many :posts
    has_many :posttools
    belongs_to :category
end

