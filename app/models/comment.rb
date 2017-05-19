class Comment < ApplicationRecord
	has_many :likes , as: :likeable,dependent: :destroy
	has_many :images,dependent: :destroy
	has_many :replies,dependent: :destroy
	belongs_to :post
	belongs_to :user
	accepts_nested_attributes_for :images,:allow_destroy=>true
	validates_presence_of :body
end
