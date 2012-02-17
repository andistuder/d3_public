FactoryGirl.define do

  factory :feature_category, :class => FeatureCategory do
    name Faker::Lorem.words
    slug "fc-slug"
    content Faker::Lorem.paragraph
    created_at Time.now
  end

  factory :feature, :class => Feature do
    name Faker::Lorem.words
    slug "f-slug"
    content Faker::Lorem.paragraph
    created_at Time.now
    association :feature_category
  end


end