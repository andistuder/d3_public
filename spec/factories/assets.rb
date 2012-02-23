FactoryGirl.define do
  factory :asset, :class => Asset do
    name Faker::Lorem.words
    description Faker::Lorem.paragraph
    created_at Time.now
  end

end