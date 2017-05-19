class Image < ApplicationRecord
	belongs_to :post
	belongs_to :comment
	belongs_to :reply
	belongs_to :user,optional:true
	 has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100"}, default_url: "/images/:style/missing.png",
  :path => ":rails_root/public/system/:class/:attachment/:id_partition/:style/:filename"
  validates_attachment :avatar, :presence => true,
  :content_type => { :content_type => ["image/jpeg", "image/gif", "image/png"] },
  :size => { :in => 0..500.kilobytes }
end