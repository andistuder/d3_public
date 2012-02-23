FactoryGirl.define do

  factory :case_study, :class => CaseStudy do |cs|
    cs.name Faker::Lorem.words
    cs.case_study_category_name Faker::Lorem.words
    cs.slug "cs-slug"
    cs.summary Faker::Lorem.paragraph

    cs.introduction Faker::Lorem.paragraph

    cs.sidebar_title Faker::Lorem.words
    cs.sidebar Faker::Lorem.paragraph
    cs.assets [Factory(:asset)]

    cs.created_at Time.now
  end
end