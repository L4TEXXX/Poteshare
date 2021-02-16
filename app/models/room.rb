class Room < ApplicationRecord
    #user,resevationモデルとの関連付け
    belongs_to :user
    has_many :reservation
    
    #validation
    validates :room_name, presence: true
    validates :room_PR, presence: true
    validates :room_price, presence: true
    validates :room_address, presence: true

    #carrierwave
    mount_uploader  :images ,ImagesUploader

    #serch
    def Room.search_area(search_area)
        Room.where(['room_address LIKE ?',"%#{search_area}%"])
    end

    def Room.search_keyword(search_keyword)
        Room.where(['room_name ? OR room_PR LIKE ? OR room_address LIKE ? ',
                        "%#{search_keyword}%", "%#{search_keyword}%","%#{search_keyword}%"])
    end


end
