class Reservation < ApplicationRecord
  #user roomへの関連づけ
  belongs_to :user
  belongs_to :room

  #バリデーション
  validates :start_date, presence:true
  validates :end_date, presence: true
  validates :num_people, presence: true
end
