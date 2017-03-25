# To the past API Server

* Ruby version

* System dependencies

* Configuration

* How to run the test suite

* Deployment instructions

---

[POST] `users/login`

<- {email, password}

-> {status: success/fail, user: Object}

[GET] `users/whoami`

-> {status, user: Object}

[POST] `users/register`

<- {email, password, name}

-> {status: success/fail}

[POST] `rooms.json`
<- {room_name}
-> {status: success/fail}

[GET] `lobby/join/:id`

<- {room_id, ...}

-> {status: success/fail}

[GET] `lobby/exit`

-> {status: success/fail}

[GET] `rooms.json`

-> [{room_name, room_id, user_in_room}]

[GET] `rooms/:id.json`

-> {room_name, room_id, users}

[GET] `lobby/ready`

-> {status: success/fail}

[GET] `lobby/unready`

-> {status: success/fail}

[GET] `lobby/check_ready`

-> {status: all_ready/not_all_ready}

[GET] `card/draw`

-> {card_name, image_url, ...}

[GET] `card/my_card`

-> [{card_name, image_url, ...}, ...]
