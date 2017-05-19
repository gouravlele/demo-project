class Reply < ApplicationRecord
	has_many :likes , as: :likeable,dependent: :destroy
	has_many :images,dependent: :destroy
	belongs_to :comment,optional:true
	belongs_to :user,optional:true
	accepts_nested_attributes_for :images,:allow_destroy=>true
	validates_presence_of :body
end
