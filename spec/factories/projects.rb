FactoryGirl.define do

  factory :project, :class => Project do
    name Faker::Lorem.words
    slug "p-slug"
    summary Faker::Lorem.paragraph
    concept Faker::Lorem.paragraph
    how_made Faker::Lorem.paragraph
    created_at Time.now
  end
end