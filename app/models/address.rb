class Address < ApplicationRecord
  validates :country, presence: true, length: { maximum: 20 }
  validates :state, presence: true, length: { maximum: 20 }
  validates :city, presence: true, length: { maximum: 20 }
  validates :address, presence: true, length: { maximum: 20 }
  belongs_to :home, required:true
  #geocoded_by :address, skip_index: true
  after_validation :geocode, :if => :address_changed?
  acts_as_mappable
  geocoded_by :full_address, skip_index: true
  def full_address
    "#{country},#{state}, #{city},#{address}"
  end
end
