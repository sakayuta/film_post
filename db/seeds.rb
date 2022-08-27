# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Admin.create!(email: 'admin@admin',password: 'admin1')


users = User.create!(
  [
    {email: '1@example.com', password: 'password', name: '山田太郎', name_kana: 'ヤマダタロウ', sex: User.sexes[:man], age_group: User.age_groups[:early20]},
    {email: '2@example.com', password: 'password', name: '山田二郎', name_kana: 'ヤマダジロウ', sex: User.sexes[:man], age_group: User.age_groups[:early20]},
    {email: '3@example.com', password: 'password', name: '山田三郎', name_kana: 'ヤマダサブロウ', sex: User.sexes[:man], age_group: User.age_groups[:early20]},
    {email: '4@example.com', password: 'password', name: '山田四郎', name_kana: 'ヤマダシロウ', sex: User.sexes[:man], age_group: User.age_groups[:early20]},
    {email: '5@example.com', password: 'password', name: '山田五郎', name_kana: 'ヤマダゴロウ', sex: User.sexes[:man], age_group: User.age_groups[:early20]},
    {email: '6@example.com', password: 'password', name: '令和令子', name_kana: 'レイワレイコ', sex: User.sexes[:man], age_group: User.age_groups[:early20]},
    {email: '7@example.com', password: 'password', name: '令和政子', name_kana: 'レイワマサコ', sex: User.sexes[:woman], age_group: User.age_groups[:early20]},
    {email: '8@example.com', password: 'password', name: '令和道子', name_kana: 'レイワミチコ', sex: User.sexes[:woman], age_group: User.age_groups[:early20]},
    {email: '9@example.com', password: 'password', name: '令和まち子', name_kana: 'レイワマチコ', sex: User.sexes[:woman], age_group: User.age_groups[:early20]},
    {email: '10@example.com', password: 'password', name: '山田花', name_kana: 'ヤマダハナ', sex: User.sexes[:woman], age_group: User.age_groups[:early20]},
    {email: '11@example.com', password: 'password', name: '山田正男', name_kana: 'ヤマダマサオ', sex: User.sexes[:man], age_group: User.age_groups[:early20]}
  ]
)

users.each do |user|
  user.profile_image.attach(io: File.open(Rails.root.join('app/assets/images/sample-author1.jpg')),
                  filename: 'sample-author1.jpg')
end

Genre.create!(
  [
    {name: '#アクション'},
    {name: '#SF'},
    {name: '#アドベンチャー'},
    {name: '#ファンタジー'},
    {name: '#ホラー'},
    {name: '#サスペンス'},
    {name: '#ミステリー'},
    {name: '#コメディー'},
    {name: '#恋愛'},
    {name: '#ファミリー'},
    {name: '#ミュージカル'},
    {name: '#アニメ'},
    {name: '#その他'},
  ]
)

Film.create!(
  [
    {user_id: 1, title: 'title1', body: 'おすすめです', star: 5, genre_id: 1},
    {user_id: 1, title: 'title2', body: 'おすすめです', star: 3.5, genre_id: 1},
    {user_id: 1, title: 'title3', body: 'おすすめです', star: 2, genre_id: 1},
    {user_id: 1, title: 'title4', body: 'おすすめです', star: 2.5, genre_id: 1},
    {user_id: 1, title: 'title5', body: 'おすすめです', star: 4, genre_id: 1},
    {user_id: 1, title: 'title6', body: 'おすすめです', star: 3, genre_id: 1},
    {user_id: 1, title: 'title7', body: 'おすすめです', star: 4.5, genre_id: 1},
    {user_id: 1, title: 'title8', body: 'おすすめです', star: 2, genre_id: 1},
    {user_id: 6, title: 'title9', body: 'おすすめです', star: 4, genre_id: 4},
    {user_id: 6, title: 'title10', body: 'おすすめです', star: 2, genre_id: 4},
    {user_id: 6, title: 'title11', body: 'おすすめです', star: 3.5, genre_id: 4},
    {user_id: 6, title: 'title12', body: 'おすすめです', star: 2.5, genre_id: 4},
    {user_id: 6, title: 'title13', body: 'おすすめです', star: 4, genre_id: 4},
    {user_id: 6, title: 'title14', body: 'おすすめです', star: 5, genre_id: 4},
    {user_id: 6, title: 'title15', body: 'おすすめです', star: 3, genre_id: 4},
  ]
)