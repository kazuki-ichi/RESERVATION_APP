class Room < ApplicationRecord

  belongs_to :user
  has_many :reservation

  has_one_attached :image
  before_create :default_image

  validates :name, presence: true
  validates :detail, presence: true
  validates :price, presence: true
  validates :address, presence: true
  validates :price, numericality: { greater_than_or_equal_to: 0 }
  validates :price, numericality: { greater_than: 1 }

  def default_image
    if !self.image.attached?
      self.image.attach(io: File.open(Rails.root.join('app', 'assets', 'images', 'default_room.png')), filename: 'default_room.png', content_type: 'image/png')
    end
  end

end