50.times { |n|
    name = Faker::Name.name
    details = Faker::Lorem.paragraph
    start_at = Faker::Date.backward(1 + Random.rand(20))
    end_at = Faker::Date.forward(1 + Random.rand(20))
    activity_image01_url = "http://www.mir.com.my/leofoo/Thai-amulets/Penang/Dhammikarama_Burmese_Temple/images/Penang_hotspot_temple.jpg"
    activity_image02_url = "http://www.mir.com.my/leofoo/Thai-amulets/Penang/Dhammikarama_Burmese_Temple/images/Penang_hotspot_temple.jpg"
    activity_image03_url = "http://www.mir.com.my/leofoo/Thai-amulets/Penang/Dhammikarama_Burmese_Temple/images/Penang_hotspot_temple.jpg"
    capacity = 1 + Random.rand(40)
    booking_status = [true, false].sample
    rules = Faker::Lorem.paragraphs
    apply_details = Faker::Lorem.paragraph
    payment_price = Random.rand(2000)
    payment_need = [true, false].sample
    avaliable = [true, false].sample
    rating = 1 + Random.rand(9)
    admin_user_id = Random.rand(20)
    temple_id = Random.rand(20)
    permanent = [true, false].sample
    youtube_url = "https://www.youtube.com/watch?v=Iv9VPXuQsjI&list=PLtWlvHthTN92DaHKeV7LRO8sie61eOVy3&index=8"

    Activity.create!(name: name,
                     details: details,
                     start_at: start_at,
                     end_at: end_at,
                     capacity: capacity,
                     booking_status: booking_status,
                     rules: rules,
                     apply_details: apply_details,
                     payment_price: payment_price,
                     payment_need: payment_need,
                     avaliable: avaliable,
                     rating: rating,
                     admin_user_id: admin_user_id,
                     temple_id: temple_id,
                     permanent: permanent,
                     youtube_url: "https://www.youtube.com/watch?v=Iv9VPXuQsjI&list=PLtWlvHthTN92DaHKeV7LRO8sie61eOVy3&index=9",
                     activity_image01_url: activity_image01_url,
                     activity_image02_url: activity_image01_url,
                     activity_image03_url: activity_image01_url)

}
