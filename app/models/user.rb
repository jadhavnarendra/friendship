class User < ApplicationRecord
  has_many :likes
  has_many :comments
  has_many :posts
  has_many :friend_sent
  has_many :friend_request
  has_many :friends
  has_many :pending_requests
  has_many :received_requests
  has_many :notifications
  mount_uploader :image, ImageUploader
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validate :picture_size

  private
  # Validates the size of an uploaded picture.
  def picture_size
    errors.add(:image, 'should be less than 1MB') if image.size > 1.megabytes
  end       
end
