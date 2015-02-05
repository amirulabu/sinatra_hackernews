u1 = User.create(name: "amirul", password:"123")

u2 = User.create(name: "kimin", password:"321")

p1 = Post.create(title: "Funny cat", link: "http://i.imgur.com/YN80Dv3.jpg", point: 0 )

c1 = Comment.create(title: "wow so cute cat")

u1.posts << p1
u2.comments << c1
p1.comments << c1