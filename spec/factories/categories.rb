FactoryGirl.define do

  factory :category, :class => Category do |cat|
    cat.name Faker::Lorem.words
    cat.created_at Time.now
  end
end