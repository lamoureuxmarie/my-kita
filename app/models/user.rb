class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :bookmarks
  has_many :profiles
  after_create :create_profile

  def create_profile
    Profile.create!(user: self)
  end

  def profile
    profiles.first
  end
end
