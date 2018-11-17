10.times do
  category = Faker::Book.unique.genre
  Category.create!(name: category)
end
