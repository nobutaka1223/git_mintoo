class Category < ActiveRecord::Base
  belongs_to :user
  belongs_to :oyacategories
  has_many :tools
  has_many :posttools,  through: :tools
  validates :name,  presence: true
  
  
  
end
