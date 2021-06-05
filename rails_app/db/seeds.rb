(1..3).each do |i| # rubocop:disable Metrics/BlockLength
  user_pass = Faker::Internet.password(min_length: 8, max_length: 20)
  store_pass = Faker::Internet.password(min_length: 8, max_length: 20)

  logger = Logger.new("log/seed.log")
  logger.debug "-----------------"
  logger.debug "user#{i}  pass: #{user_pass}"
  logger.debug "store#{i} pass: #{store_pass}"

  user = User.create!(name: "ユーザー#{i}",
                      email: "user#{i}@sample.com",
                      furigana: "ユーザー#{i}",
                      tel: "12345678#{i}",
                      birthday: "2021041#{i}",
                      gender: "男",
                      address: "大阪",
                      password: user_pass,
                      password_confirmation: user_pass)

  store = Store.create!(name: "店舗#{i}",
                        email: "store#{i}@sample.com",
                        furigana: "テンポ#{i}",
                        tel: "12345678#{i}",
                        fax: "12345678#{i}",
                        postal_code: "1234567",
                        url: "http://sample#{i}.com",
                        address: "大阪",
                        seat: i * 100,
                        restaurant: "店舗名#{i}",
                        genre: "飲食業",
                        responsible_party: "担当者#{i}",
                        other: "アレルギー#{i}",
                        password: store_pass,
                        password_confirmation: store_pass)

  Reservation.create!(date_at: "2021-0#{i}-0#{i}",
                      date_on: "2021-0#{i}-0#{i}",
                      number_people: "#{i}#{i}#{i}",
                      menu: "メニュー#{i}",
                      budget: 10000,
                      inquiry: "メモ#{i}",
                      reservation_number: "ABC#{i}#{i}#{i}" * 2,
                      user_id: user.id,
                      store_id: store.id)
end
