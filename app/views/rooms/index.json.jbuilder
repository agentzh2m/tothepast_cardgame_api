json.rooms @rooms do |room|
  json.room_name room.name
  json.room_users room.users
end
