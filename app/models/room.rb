class Room < ApplicationRecord
    #user,resevationモデルとの関連付け
    belongs_to :user
    has_many :reservation
    
    #validation
    validates :room_name, presence: true
    validates :room_PR, presence: true
    validates :room_price, presence: true
    validates :room_address, presence: true
end
