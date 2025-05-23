# db/seeds.rb

# Create an Admin
Admin.find_or_create_by!(email: 'admin@example.com') do |admin|
  admin.password = '123456'
  admin.password_confirmation = '123456'
  admin.name = 'Admin'
  admin.nickname = 'admin'
  # Add any other essential attributes here
end

# Create a User
User.find_or_create_by!(email: 'user@example.com') do |user|
  user.password = '123456'
  user.password_confirmation = '123456'
  user.name = 'User'
  user.nickname = 'user'
  # Add any other essential attributes here
end

puts "Admin and User seeds created!"