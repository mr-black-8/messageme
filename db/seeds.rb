User.destroy_all

u1 = User.create :first => 'Sam', :last => 'Humphreys', :password => 'Adminchicken', :email => 'sam@ga.co', :admin => true, :image => 'http://res.cloudinary.com/iamasamwich/image/upload/v1462686798/qf42dxcmfwumiqrkiqqe.jpg'
u2 = User.create :first => 'Bill', :last => 'Murray', :password => 'chicken', :email => 'bill@ga.co', :image => 'http://res.cloudinary.com/iamasamwich/image/upload/v1462689165/m1jriyo8d2cc7t4lcyrs.jpg'
u3 = User.create :first => 'Charlie', :last => 'Sheen', :password => 'chicken', :email => 'charlie@ga.co', :image => 'http://res.cloudinary.com/iamasamwich/image/upload/v1461291658/rhyoiyxjcgtfvz87wn7b.gif'
u4 = User.create :first => 'Nick', :last => 'Cage', :password => 'chicken', :email => 'nick@ga.co', :image => 'http://res.cloudinary.com/iamasamwich/image/upload/v1461509967/omrqt5likrdvf5jsi4f2.jpg'

Message.destroy_all

m1 = Message.create :user_id => u1.id, :target => u2.id, :format => 'text', :seen => false, :content => 'Hi Bill, this is Sam!'
m2 = Message.create :user_id => u1.id, :target => u4.id, :format => 'text', :seen => false, :content => 'Hi Nick, this is a message from Sam. I hope you enjoy reading it :D'
m3 = Message.create :user_id => u2.id, :target => u4.id, :format => 'text', :seen => false, :content => 'Hi Nick, this is Bill Murray. For relaxing times, make it a Santori time.'
m4 = Message.create :user_id => u2.id, :target => u1.id, :format => 'text', :seen => false, :content => 'Hey Sam, have you seen my favourite movie, Garfield?'
