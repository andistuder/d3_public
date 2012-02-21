FactoryGirl.define do

  factory :partner, :class => Partner do
    name Faker::Lorem.words
    slug "pa-slug"
    content Faker::Lorem.paragraph
    created_at Time.now
  end

  factory :partner_category, :class => PartnerCategory do
    name Faker::Lorem.words
    slug "pac-slug"
    content Faker::Lorem.paragraph
    created_at Time.now
  end

end