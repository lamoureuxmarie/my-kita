class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :bookmarks
  has_one :profile
  after_create :create_profile
  has_many :ratings
  has_secure_token :telegram_token, length: 24

  def create_profile
    Profile.create!(user: self)
  end

  # def profile
  #   profiles.first
  # end
end
