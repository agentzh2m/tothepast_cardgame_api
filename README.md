# To the past API Server

* Ruby version

* System dependencies

* Configuration

* How to run the test suite

* Deployment instructions

---

[POST] `user/login`

<- {email, password}

-> {status: success/fail, user: Object}

[GET] `user/whoami`

-> {status, user: Object}

[POST] `user/register`

<- {email, password, name}

-> {status: success/fail}

[POST] `room/join`

<- {email, room_id, ...}

-> {status: success/fail}

[GET] `room/exit`

-> {status: success/fail}

[GET] `room`

-> [{room_name, room_id, user_in_room}]

[GET] `room/:id`

-> {room_name, room_id, users}

[GET] `user/ready`

-> {status: success/fail}

[GET] `user/unready`

-> {status: success/fail}

[GET] `room/check_ready`

-> {status: all_ready/not_all_ready}

[GET] `card/draw`

-> {card_name, image_url, ...}

[GET] `card/my_card`

-> [{card_name, image_url, ...}, ...]
