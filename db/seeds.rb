# Create some Articles

10.times do
  title = Faker::Lorem.sentence
  body = Faker::Lorem.paragraph(2)

  Article.create(title: title, body: body)
end
