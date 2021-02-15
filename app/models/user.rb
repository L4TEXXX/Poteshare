class User < ApplicationRecord
    has_many :room, dependent: :destroy
    has_many :reservation, dependent: :destroy
    #各カラムへのvalidation
    validates :name, presence: true, length: {maximum: 30}
    validates :email, presence: true, length: {maximum: 255},uniqueness: true
    
    #validation
    has_secure_password
    
    #carrierwave
    mount_uploader :image, ImageUploader
end
