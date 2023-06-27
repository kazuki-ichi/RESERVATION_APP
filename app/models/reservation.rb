class Reservation < ApplicationRecord
    belongs_to :room, optional: true
    belongs_to :user, optional: true

    has_one_attached :image

    validates :check_in, presence: true
    validates :rcheck_out, presence: true

    validate :start_end_check

    def start_end_check
        if check_in.nil? || rcheck_out.nil?
            return
        end
        if rcheck_out <= check_in
            errors.add(:rcheck_out, "は開始日以前の日付は登録できません") 
        end
     end

     def sum_of_reservation_price
        count * room.price * days
      end
        
     def days
      remain = ((rcheck_out -  check_in  )/ 60 / 60 / 24 ).to_i
      
     end
    end
