# Create Users
User.create!(
  name: "John Doe",
  email: "john@example.com",
  password: "password"
)

User.create!(
  name: "Jane Smith",
  email: "jane@example.com",
  password: "password"
)

# Create Tasks
users = User.all

users.each do |user|
  5.times do |n|
    Task.create!(
      user: user,
      description: "Task #{n + 1} for #{user.name}",
      completed: [true, false].sample
    )
  end
end

puts "Seed data created successfully."
