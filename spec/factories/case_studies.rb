FactoryGirl.define do

  factory :case_study, :class => CaseStudy do
    name Faker::Lorem.words
    case_study_category_name Faker::Lorem.words
    slug "cs-slug"
    summary Faker::Lorem.paragraph
    assets [Factory(:asset)]
    #association :asset
    created_at Time.now
  end
end