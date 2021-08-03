User.delete_all
user = User.create! email: 'toto@toto.fr', password: 'toto123'
puts "Created a new user: #{user.email}"