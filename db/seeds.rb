# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Add Test User
User.create!(name: 'karn', email: 'karn@gmail.com', password: 'karn1234')
User.create!(name: 'ham', email: 'ham@gmail.com', password: 'ham1234')
User.create!(name: 'me', email: 'me@gmail.com', password: 'me1234')
User.create!(name: 'my', email: 'my@gmail.com', password: 'my1234')

# Add Base Characters

Character.create!(name: 'Altair', description: 'You are the one that travel back in time to kill the prime minister')
Character.create!(name: 'Hank The Detective', description: 'You have the authority to put people in JAIL!!
find out who is the real threat to the prime minister')
Character.create!(name: 'Mr.Thatcher The Prime Minister', description: 'You are the most powerful person in the country
therefore someone is targeting your life you must eliminate that threat')
Character.create!(name: 'Tom the Citizen', description: 'You are a clueless citizen that might know about the iminent threat
you either stay neutral or bias up to you!!!')

# Add Normal Cards
Card.create!(name: 'Steal', description: 'steal a card from other player')
Card.create!(name: 'Deny', description: 'deny any action card from other player')
Card.create!(name: 'Gold', description: 'add 2 coins')
Card.create!(name: 'Silver', description: 'add 1 coins')


# Add special card
SpecialCard.create!(name: 'Assassinate',
description: 'kill the targeted user and suspend them for two round', cost: 6)
SpecialCard.create!(name: 'Protector',
description: 'can be hired to protect the player for one turn', cost: 4)
SpecialCard.create!(name: 'Killer',
description: 'hire an assassin to kill for you', cost: 8)
SpecialCard.create!(name: 'Confess',
description: 'force a person to confess his real indentity',cost: 10)
