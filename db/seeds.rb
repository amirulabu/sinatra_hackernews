u1 = User.create(name: "amirul", password:"123")

u2 = User.create(name: "kimin", password:"321")

p1 = Post.create(title: "Funny cat", link: "http://i.imgur.com/YN80Dv3.jpg", point: 0 )

c1 = Comment.create(title: "wow so cute cat")

cv1 = Commentvote.create(like: 1)
pv1 = Postvote.create(like: 1)

u1.posts << p1
u2.comments << c1
p1.comments << c1

c1.commentvotes << cv1
u1.commentvotes << cv1

p1.postvotes << pv1
u2.postvotes << pv1

