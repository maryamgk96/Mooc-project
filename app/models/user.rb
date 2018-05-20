class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  enum gender: {male: 0, female: 1, any: 2}
  validates :profile_picture, file_size: { less_than: 1.megabytes }
  mount_uploader :profile_picture, ImageUploader
  ROLES = %w[instructor user].freeze
  has_many :courses, dependent: :destroy
  has_and_belongs_to_many :lectures
  acts_as_voter
        
end
