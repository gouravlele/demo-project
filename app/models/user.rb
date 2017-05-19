class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  attr_accessor :login
  devise :database_authenticatable, :registerable, :confirmable,:lockable,
         :recoverable, :rememberable, :trackable, :validatable,:authentication_keys => [:login]
         has_many :posts
         has_many :comments
         has_many :replies
         has_many :likes 
         has_many :images
  validates_uniqueness_of :user_name
  validates_uniqueness_of :mobile_no
  validates_uniqueness_of :email 
  has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100"}, default_url: "/images/:style/missing.png",
  :path => ":rails_root/public/system/:class/:attachment/:id_partition/:style/:filename"
  validates_attachment :avatar, :presence => true,
  :content_type => { :content_type => ["image/jpeg", "image/gif", "image/png"] },
  :size => { :in => 0..500.kilobytes }
  def self.find_for_database_authentication(warden_conditions)
      conditions = warden_conditions.dup
    if login = conditions.delete(:login)
       where(conditions).where(["mobile_no = :value OR lower(email) = lower(:value) OR lower(user_name)= :value", { :value => login }]).first
    elsif conditions.has_key?(:user_name) || conditions.has_key?(:email) ||conditions.has_key?(:mobile_no)
        where(conditions.to_h).first
    end
  end
end
