require 'json'

class DownloadRoomStatusJob < ApplicationJob
  queue_as :default

  def perform(*args)
    data = open('http://www.kongregate.com/rooms.js').read
    json = data[20..-4]
    categories = JSON.parse(json)
    categories.each { |category| parse_category(category) }
    true
  end

  def parse_category(category)
    category['rooms'].each do |json_room|
      params = room_params json_room
      if Room.exists?(room_id: params[:room_id])
        room = Room.find_by_room_id(params[:room_id])
        room.update!(params)
      else
        room = Room.create!(params)
      end

      RoomStatus.create!({
        total_user_count:       json_room['total_user_count'],
        registered_user_count:  json_room['registered_user_count'],
        joinable:               json_room['joinable'],
        room:                   room
      })
    end
  end

  def room_params(room)
    {
      room_id:      room['id'],
      name:         room['name'],
      premium_only: room['premium_only'],
      owner:        room['owner'],
      language:     room['language'],
      description:  room['description']
    }
  end
end
