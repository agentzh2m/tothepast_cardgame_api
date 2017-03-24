json.partial! "rooms/room", room: @room
json.array! @users, as: :users
