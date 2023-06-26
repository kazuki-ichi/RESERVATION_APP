class Room < ApplicationRecord
    # validate :start_end_check

    # def start_end_check
    # errors.add(:rcheck_out, "は開始日より前の日付は登録できません。") unless
    # self.check_in < self.rcheck_out  
    #  end
    belongs_to :user
    has_many :reservation

    has_one_attached :image


    before_create :default_image
  def default_image
    if !self.image.attached?
        self.image.attach(io: File.open(Rails.root.join('app', 'assets', 'images', 'default_room.png')), filename: 'default_room.png', content_type: 'image/png')
    end
  end

  
end
