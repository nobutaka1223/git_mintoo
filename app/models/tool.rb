class Tool < ActiveRecord::Base
    has_many :posts , dependent: :destroy
    has_many :posttools, dependent: :destroy
    belongs_to :category
end

