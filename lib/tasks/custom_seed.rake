namespace :custom_seed do
  desc "TODO"
  task posts: :environment do
    25.times do |i|
      Post.create!(
          title:       Faker::Lorem.sentence,
          description: Faker::Lorem.paragraphs(6).join("\n\n"),
          summary:     Faker::Lorem.paragraph[0..154],
          created_at:  Time.now,
          updated_at:  Time.now
      )
    end
  end

end
