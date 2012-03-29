FactoryGirl.define do

  factory :partner, :class => Partner do
    name Faker::Lorem.words
    slug "pa-slug"
    summary Faker::Lorem.paragraph
    created_at Time.now
    #association :partner_category
    town "London"
    postcode "E1 111"
    country "United Kingdom"
    email "dummy@user.com"
    website "http://user.com"
    phone "012 345 6799"
  end

  factory :partner_category, :class => PartnerCategory do
    name Faker::Lorem.words
    slug "pac-slug"
    content Faker::Lorem.paragraph
    created_at Time.now
    partners {|p| [p.association(:partner)]}
  end

  factory :partner_content_area, :class => PartnerContentArea do
    title Faker::Lorem.words
    content Faker::Lorem.paragraph
    created_at Time.now
  end

end