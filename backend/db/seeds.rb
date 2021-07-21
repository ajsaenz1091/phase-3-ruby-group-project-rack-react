require 'faker'

# guardians = [
#     {
#     user_id: 1
#     class: "Hunter"
#     power: 1352
#     },
#     {
#         user_id: 1
#         class: "Hunter"
#         power: 1352
#     }
# ]


# gardians.each do |gardian|
#     Gardian.create(user_id: gardian.user_id, class: )
# end
# create users
5.times do
    User.create(name: Faker::Name.name)
end


puts "Seeding users..."

# create courses

25.times do
    Course.create(name: Faker::Hipster.sentence(word_count: 3),rating: rand(1..25), user_id: rand(1..5))
end

puts "Seeding courses..."

puts "Done!"