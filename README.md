# To the past API Server

Worapol Boontanonda 5780431, Nattakarn Klongyut 5780130

TO RUN

  - `rake db:create db:migrate db:seed`

  - `rails s`

Access through `localhost:3000`

UML diagram in the `doc/model_complete.svg` directory

---

## Incomplete doc [Ask Ham instead]

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
