class User < ApplicationRecord
    #各カラムへのvalidation
    validates :name, presence: true, length: {maximum: 30}
    validates :email, presence: true, length: {maximum: 255},uniqueness: true
    
    #validation
    has_secure_password
    
end
