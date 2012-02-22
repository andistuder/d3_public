FactoryGirl.define do

  factory :project, :class => Project do
    name Faker::Lorem.words
    slug "p-slug"
    summary Faker::Lorem.paragraph
    how_made Faker::Lorem.paragraph
    how_made_title Faker::Lorem.words
    created_at Time.now
  end

  factory :project_category, :class => ProjectCategory do
    name Faker::Lorem.words
    slug "pc-slug"
    summary Faker::Lorem.paragraph
    content Faker::Lorem.paragraph
    created_at Time.now
  end

  factory :project_content_area, :class => ProjectContentArea do
    title Faker::Lorem.words
    content Faker::Lorem.paragraph
    created_at Time.now
  end

  factory :asset, :class => Asset do
    name Faker::Lorem.words
    description Faker::Lorem.paragraph
    created_at Time.now
  end

end