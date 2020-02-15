# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
if Rails.env == 'development'
  (1..50).each do |i|
    	User.create!(
		name:"#{i}#{i}",
		email: "#{i}@#{i}",
		password: '111111',
		introduction: "週に#{i}冊は本読んでます！よろしくお願いします！"
	 )
  end
end

User.create!(
	[	
		{
		 email: 'a@a',
		 password: '123456',
		 name: 'テストマン',
		 introduction: 'ウルフバーンが好きです'

		},
		{
		 email: 'b@b',
		 password: '123123',
		 name: 'テストマン2',
		 introduction: 'なんでも飲みます'

		}

	]
	)

