# Create Users
User.create!(
  email: "john@example.com",
  password: "password"
)

User.create!(
  email: "jane@example.com",
  password: "password"
)

# Create Tasks
users = User.all

users.each do |user|
  5.times do |n|
    Task.create!(
      user: user,
      description: "Task #{n + 1}",
      completed: [true, false].sample
    )
  end
end

puts "Seed data created successfully."
