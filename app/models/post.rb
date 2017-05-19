class Post < ApplicationRecord
	belongs_to :user,optional:true
	has_many :likes , as: :likeable,dependent: :destroy
	has_many :images,dependent: :destroy
	validates_presence_of :post
	attr_accessor :avatar
	has_many :comments,dependent: :destroy
	accepts_nested_attributes_for :images,:allow_destroy=>true
  before_create :to_upcase
	before_update :to_upcase
	
	def authorized(user)
		self.user != user
	end

	private
	def to_upcase
    self.post=post.upcase
	end
	
end
