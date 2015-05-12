# Scopes
scope = Scope.new name: 'user', description: 'Grants read/write access to profile.'
scope.save!
scope = Scope.new name: 'user:email', description: 'Grants read access to a user’s email addresses.'
scope.save!

# Users
user = User.new name: 'saso', email: 'matejina@gmail.com', scope: 'user'
user.save!

# Clients
client = Client.new name: 'example', website: 'http://example.com/', redirect_uri: 'https://www.getpostman.com/oauth2/callback', user: user
client.save!


