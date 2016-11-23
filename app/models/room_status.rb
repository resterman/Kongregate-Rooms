class RoomStatus < ApplicationRecord
  validates :total_user_count, :registered_user_count, :room_id, presence: true
  belongs_to :room
end
