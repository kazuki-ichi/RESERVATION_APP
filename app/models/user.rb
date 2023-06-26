class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_one_attached :avatar

  
 has_many :rooms 
 has_many :reservations

  validates :name, presence: true #追記
  validates :profile, length: { maximum: 200 } #追記

  has_one_attached :image

  before_create :default_image
  def default_image
    if !self.avatar.attached?
      self.avatar.attach(io: File.open(Rails.root.join('app', 'assets', 'images', 'default_icon.png')), filename: 'default_icon.png', content_type: 'image/png')
    end
  end
end
