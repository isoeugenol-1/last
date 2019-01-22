class Home < ApplicationRecord
  validates :home, presence: true
  validates :space, presence: true
  validates :area, presence: true
  validates :price, presence: true
  validates :address, presence: true
  validates :ldk, presence: true
  has_many :favorites, dependent: :destroy
  has_many :favorite_users, through: :favorites, source: :user
  belongs_to :user
  mount_uploader :image, ImageUploader
  geocoded_by :address
  after_validation :geocode
end
