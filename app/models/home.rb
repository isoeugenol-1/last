class Home < ApplicationRecord
  validates :home, presence: true, uniqueness: true
  validates :space, presence: true
  validates :area, presence: true
  validates :price, presence: true
  validates :address, presence: true, uniqueness: true
  validates :ldk, presence: true
  has_many :favorites, dependent: :destroy
  has_many :favorite_users, through: :favorites, source: :user
  belongs_to :user
  mount_uploaders :image, ImageUploader
  geocoded_by :address, skip_index: true
  after_validation :geocode, :if => :address_changed?

end
