# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Post.create(user_id: 0, content: "This is the first ever post", image: "",date: Time.now)
Post.create(user_id: 0, content: "This is a follow up post", image: "", date: Time.now)
Post.create(user_id: 0, content: "Final post for now", image: "", date: Time.now)
