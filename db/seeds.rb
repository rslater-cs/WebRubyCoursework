

user1 = User.create(email:"test.user@email.com", password:"testpassword")
user2 = User.create(email:"second.user@email.com", password: "secondpass")

Post.create(user_id: user1.id, content: "Hello this is my first post on this website", dateposted: "2020-12-12")
Post.create(user_id: user2.id, content: "I am the second user on this site", dateposted: "2020-11-12")
Post.create(user_id: user1.id, content: "This is my second post", dateposted: "2020-12-15")
Post.create(user_id: user2.id, content: "Try out posting a photo by clicking the 'New' button", dateposted: "2020-12-20")

Issue.create(name: "First User", email: "test.user@email.com", telephone:"0123456789", message: "Hello I have an issue. I cannot make a new post", closed: false)
Issue.create(name: "First User", email: "test.user@email.com", telephone:"0123456789", message: "How do I make an account for this website?", closed: true)