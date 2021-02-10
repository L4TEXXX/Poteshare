class Reservation < ApplicationRecord
  #user roomへの関連づけ
  belongs_to :user
  belongs_to :room
end
