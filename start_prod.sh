export SECRET_KEY_BASE = fd94c28ca8e21366ddf0c57201191c498b8a4c644d3863135a94edc68a566e00124e6b70b48f32a0838a6d47a0d87c372b5cd0d05b2d65adcb8ff0d24214bbc3

rails db:create
rails db:migrate
rails db:seed

rails server -p 3000 -b 0.0.0.0
