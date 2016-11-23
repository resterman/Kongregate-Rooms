class Room < ApplicationRecord
  validates :room_id, :owner, :language, :description, presence: true
end
