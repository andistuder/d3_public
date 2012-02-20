FactoryGirl.define do

  factory :project, :class => Project do
    name Faker::Lorem.words
    slug "p-slug"
    summary Faker::Lorem.paragraph
    concept Faker::Lorem.paragraph
    how_made Faker::Lorem.paragraph
    created_at Time.now
  end

  factory :project_category, :class => ProjectCategory do
    name Faker::Lorem.words
    slug "pc-slug"
    summary Faker::Lorem.paragraph
    content Faker::Lorem.paragraph
    created_at Time.now
  end

end