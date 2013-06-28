10.times do
  Post.create!(
    :title => Faker::Lorem.sentence,
    :body => Faker::Lorem.paragraphs(rand(2..4)).join("\n\n"), 
    :tags => [Tag.find_or_create_by!(:name => Faker::Lorem.words(rand(1..3)).join(" ")),Tag.find_or_create_by!(:name => Faker::Lorem.words(rand(1..3)).join(" ")),Tag.find_or_create_by!(:name => "seed")])
end

