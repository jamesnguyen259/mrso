10.times do
  category = Faker::Book.genre
  Category.create!(name: category)
end
