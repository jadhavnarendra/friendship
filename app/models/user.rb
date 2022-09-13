class User < ApplicationRecord
  mount_uploader :image, ImageUploader
  validate :picture_size
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validate :picture_size

  has_many :posts
  has_many :comments
  has_many :likes, dependent: :destroy
  has_many :notifications, dependent: :destroy

  has_many :friend_sent
  has_many :friend_request
  has_many :friends
  has_many :pending_requests
  has_many :received_requests

# Returns a string containing this user's first name and last name
  def full_name
    "#{fname} #{lname}"
  end

  def friends_and_own_posts
    myfriends = friends
    our_posts = []
    
      
    

    posts.each do |p|
      our_posts << p
    end

    our_posts
  end
  
  # Returns all posts from this user's friends and self
  

  private
  # Validates the size of an uploaded picture.
  def picture_size
    errors.add(:image, 'should be less than 1MB') if image.size > 1.megabytes
  end
end