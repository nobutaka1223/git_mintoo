class Tool < ActiveRecord::Base
    has_many :posts
    belongs_to :category
end
