class Home < ApplicationRecord
  validates :home, presence: true, uniqueness: true, length: { maximum: 30 }
  validates :space, presence: true, length: { maximum: 10 }
  validates :sikikinn, presence: true, length: { maximum: 10 }
  validates :reikinn, presence: true, length: { maximum: 10 }
  validates :area, presence: true, length: { maximum: 20 }
  validates :price, presence: true, length: { maximum:10 }
  validates :address, presence: true, uniqueness: true, length: { maximum: 30 }
  validates :ldk, presence: true
  has_many :favorites, dependent: :destroy
  has_many :favorite_users, through: :favorites, source: :user
  belongs_to :user
  mount_uploaders :image, ImageUploader
  geocoded_by :addressto, skip_index: true
  geocoded_by :address, skip_index: true
  after_validation :geocode, :if => :address_changed?

end
