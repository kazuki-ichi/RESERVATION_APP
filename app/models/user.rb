class User < ApplicationRecord

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :rooms 
  has_many :reservations

  has_one_attached :avatar
  has_one_attached :image

  validates :name, presence: true #追記
  validates :profile, length: { maximum: 200 } #追記

  before_create :default_image

  def default_image
    if !self.avatar.attached?
      self.avatar.attach(io: File.open(Rails.root.join('app', 'assets', 'images', 'default_icon.png')), filename: 'default_icon.png', content_type: 'image/png')
    end
  end

end