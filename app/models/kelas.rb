class Kelas < ApplicationRecord
  acts_as_commentable
  has_many :videos
  has_many :links
  has_many :materis
  
#  belongs_to :user
end
