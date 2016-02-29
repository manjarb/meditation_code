# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# 30.times { |n|
#     name = Faker::Name.name
#     username = Faker::Internet.user_name
#     email = "example#{n}@jarbstudio.com"
#     password = "123456"
#     AdminUser.create!(name: name,
#                       username: username,
#                       email: email,
#                       password: password,
#                       password_confirmation: password)
# }

# 3.times { |n|
#     admin_user_id = 42
#     account_number = Faker::Business.credit_card_number
#     name = Faker::Company.name
#     owner_name = Faker::Name.name
#     bank_name = Faker::Company.name
#     BankAccount.create!(name: name,
#                         number: account_number,
#                         admin_user_id: admin_user_id,
#                         owner_account_name: owner_name,
#                         bank_name: bank_name
#     )
# }

# 20.times { |n|
#     name = Faker::Name.name
#     details = Faker::Lorem.paragraph
#     start_at = Faker::Date.backward(1 + Random.rand(20))
#     end_at = Faker::Date.forward(1 + Random.rand(20))
#     activity_image01_url = Faker::Placeholdit.image
#     activity_image02_url = Faker::Placeholdit.image
#     activity_image03_url = Faker::Placeholdit.image
#     capacity = 1 + Random.rand(40)
#     booking_status = [true, false].sample
#     rules = Faker::Lorem.paragraphs
#     apply_details = Faker::Lorem.paragraph
#     payment_price = Random.rand(2000)
#     payment_need = [true, false].sample
#     avaliable = [true, false].sample
#     rating = 1 + Random.rand(9)
#     admin_user_id = Random.rand(20)
#     temple_id = Random.rand(20)
#     permanent = [true, false].sample
#     youtube_url = "https://www.youtube.com/watch?v=Iv9VPXuQsjI&list=PLtWlvHthTN92DaHKeV7LRO8sie61eOVy3&index=9"
#
#     Activity.create!(name: name,
#                      details: details,
#                      start_at: start_at,
#                      end_at: end_at,
#                      capacity: capacity,
#                      booking_status: booking_status,
#                      rules: rules,
#                      apply_details: apply_details,
#                      payment_price: payment_price,
#                      payment_need: payment_need,
#                      avaliable: avaliable,
#                      rating: rating,
#                      admin_user_id: admin_user_id,
#                      temple_id: temple_id,
#                      permanent: permanent,
#                      youtube_url: "https://www.youtube.com/watch?v=Iv9VPXuQsjI&list=PLtWlvHthTN92DaHKeV7LRO8sie61eOVy3&index=9",
#                      activity_image01_url: activity_image01_url,
#                      activity_image02_url: activity_image01_url,
#                      activity_image03_url: activity_image01_url)
#
# }

50.times { |n|
    comment = Faker::Lorem.paragraph
    score = 1 + Random.rand(9)
    user_id = 0 + Random.rand(10)
    activity_id = 0 + Random.rand(20)

    Review.create!(comment: comment, score: score, user_id: user_id, activity_id: activity_id)
}

